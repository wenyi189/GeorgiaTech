import numpy as np
import pandas as pd
from scipy import sparse
import torch
from torch.utils.data import TensorDataset, Dataset


def load_seizure_dataset(path, model_type):
	"""
	:param path: a path to the seizure data CSV file
	:return dataset: a TensorDataset consists of a data Tensor and a target Tensor
	"""
	# TODO: Read a csv file from path.
	# TODO: Please refer to the header of the file to locate X and y.
	# TODO: y in the raw data is ranging from 1 to 5. Change it to be from 0 to 4.
	# TODO: Remove the header of CSV file of course.
	# TODO: Do Not change the order of rows.
	# TODO: You can use Pandas if you want to.
	df = pd.read_csv(path)
	df['y'] -= 1

	if model_type == 'MLP':
		# Multi Layer Perceptron Lab: https://github.com/ast0414/CSE6250BDH-LAB-DL/blob/master/1_FeedforwardNet.ipynb
		# Data Construction do I need to add 1's: https://piazza.com/class/jjjilbkqk8m1r4?cid=998
		df_mlp = df.copy()
		df_mlp['X0'] = 1
		X = df_mlp.drop('y', axis=1).values
		y = df_mlp.y.values		
		data = torch.from_numpy(X.astype(np.float32))
		target = torch.from_numpy(y.astype(np.int))
		dataset = TensorDataset(data, target)
	elif model_type == 'CNN':
		# CNN Lab: https://github.com/ast0414/CSE6250BDH-LAB-DL/blob/master/2_CNN.ipynb
		# Data Construction: See "1. Loading Datasets" section of above.
		df_cnn = df.copy()
		X = df_cnn.drop('y', axis=1).values
		y = df_cnn.y.values
		data = torch.from_numpy(X.astype(np.float32)).unsqueeze(1)
		target = torch.from_numpy(y.astype(np.int))
		dataset = TensorDataset(data, target)

	elif model_type == 'RNN':
		# RNN Lab: https://github.com/ast0414/CSE6250BDH-LAB-DL/blob/master/3_RNN.ipynb
		df_rnn = df.copy()
		X = df_rnn.drop('y', axis=1).values
		y = df_rnn.y.values		
		data = torch.from_numpy(X.astype(np.float32)).unsqueeze(2)
		target = torch.from_numpy(y.astype(np.int))
		dataset = TensorDataset(data, target)
	else:
		raise AssertionError("Wrong Model Type!")

	return dataset


class VisitSequenceWithLabelDataset(Dataset):
	def __init__(self, seqs, labels, num_features):
		"""
		Args:
			seqs (list): list of patients (list) of visits (list) of codes (int) that contains visit sequences
			labels (list): list of labels (int)
			num_features (int): number of total features available
		"""

		if len(seqs) != len(labels):
			raise ValueError("Seqs and Labels have different lengths")

		self.labels = labels

		# TODO: Complete this constructor to make self.seqs as a List of which each element represent visits of a patient
		# TODO: by Numpy matrix where i-th row represents i-th visit and j-th column represent the feature ID j.
		# TODO: You can use Sparse matrix type for memory efficiency if you want.
		
		# Initialize self.seqs with values from labels. Doesn't really matter just create
		# a list of size of length labels
		self.seqs = [i for i in range(len(labels))]  # replace this with your implementation.

		# Loop through all patients
		for i in range(len(seqs)):
			single_patient_seq = seqs[i]
			rows = len(single_patient_seq)	
			new_matrix = np.zeros(shape=(rows, num_features))
			for a in range(len(single_patient_seq)):
				admission = single_patient_seq[a]
				admission = np.array(admission)
				# Doing this somewhat hackily, since if there are 901 features, that means the indices are 0,...,900
				admission = admission - 1
				# This is basically setting the columns (represented by diagnoses that are elements in admission) to 1
				new_matrix[a, admission] = 1
			self.seqs[i] = new_matrix

	def __len__(self):
		return len(self.labels)

	def __getitem__(self, index):
		# returns will be wrapped as List of Tensor(s) by DataLoader
		return self.seqs[index], self.labels[index]


def visit_collate_fn(batch):
	"""
	DataLoaderIter call - self.collate_fn([self.dataset[i] for i in indices])
	Thus, 'batch' is a list [(seq1, label1), (seq2, label2), ... , (seqN, labelN)]
	where N is minibatch size, seq is a (Sparse)FloatTensor, and label is a LongTensor

	:returns
		seqs (FloatTensor) - 3D of batch_size X max_length X num_features
		lengths (LongTensor) - 1D of batch_size
		labels (LongTensor) - 1D of batch_size
	"""

	# TODO: Return the following two things
	# TODO: 1. a tuple of (Tensor contains the sequence data , Tensor contains the length of each sequence),
	# TODO: 2. Tensor contains the label of each sequence
	# print('printing from visit collate fn')
	# print(type(batch))
	# print(len(batch[0]))
	# print(batch[0])

	seqs = [b[0] for b in batch]
	seqs_num_rows = [b[0].shape[0] for b in batch]
	labels = [b[1] for b in batch]

	# Sorting: https://stackoverflow.com/questions/2732994/python-sort-a-list-and-change-another-one-consequently
	sorted_index = np.argsort(-1 * np.array(seqs_num_rows))
	seqs_sorted = [seqs[i] for i in sorted_index]
	labels_sorted = np.array([labels[i] for i in sorted_index])
	lengths_sorted = np.array([seqs_num_rows[i] for i in sorted_index])

	# Now need to pad rows of shorter matrices with 0's
	max_rows = seqs_sorted[0].shape[0]
	for i in range(len(seqs_sorted)):
		num_rows_sequence = seqs_sorted[i].shape[0]
		row_diff = max_rows - num_rows_sequence
		if row_diff > 0:
			# See https://stackoverflow.com/questions/38191855/zero-pad-numpy-array/38192105
			seqs_sorted[i] = np.pad(seqs_sorted[i], ((0, row_diff), (0, 0)), 'constant')

	# I think to create seqs_tensor from a list of numpy arrays need to do something like:
	# https://stackoverflow.com/questions/44429199/how-to-load-a-list-of-numpy-arrays-to-pytorch-dataset-loader
	seqs_tensor = torch.stack([torch.Tensor(i) for i in seqs_sorted])
	
	# I think because lengths and labels is 1D this should be easier
	# see https://stackoverflow.com/questions/42894882/how-to-convert-a-list-or-numpy-array-to-a-1d-torch-tensor for example
	lengths_tensor = torch.from_numpy(lengths_sorted.astype(np.int))
	labels_tensor = torch.from_numpy(labels_sorted.astype(np.int))

	return (seqs_tensor, lengths_tensor), labels_tensor
