# Do not use anything outside of the standard distribution of python
# when implementing this class
# Note that number of features should be 3618: https://piazza.com/class/jjjilbkqk8m1r4?cid=444
# To run: cat ../pig/training/part-r-00000 | python train.py -f 3618
import math 

class LogisticRegressionSGD:
    """
    Logistic regression with stochastic gradient descent
    """

    def __init__(self, eta, mu, n_feature):
        """
        Initialization of model parameters
        """
        self.eta = eta
        self.mu = mu
        self.weight = [0.0] * n_feature

    def find_feature(self, X, j):
        """
        Find feature j within X (single training point)

        Since X is Sparse there is high likelihood that the single training point does not have non-zero value for feature j.
        In this case return 0 
        """
        X_dict = dict(X)
        return X_dict.get(j, 0)

    def fit(self, X, y):
        """
        Update model using a pair of training sample

        Basically, just take the equation in 1.2.e to update the next weight.
        """
        for j in range(len(self.weight)):
            w = self.weight[j]
            x_j = self.find_feature(X, j)
            self.weight[j] = w + self.eta * ((y - self.predict_prob(X)) * x_j - (2 * self.mu * w))

    def predict(self, X):
        """
        Predict 0 or 1 given X and the current weights in the model
        """
        return 1 if self.predict_prob(X) > 0.5 else 0

    def predict_prob(self, X):
        """
        Sigmoid function
        """
        return 1.0 / (1.0 + math.exp(-math.fsum((self.weight[f]*v for f, v in X))))
