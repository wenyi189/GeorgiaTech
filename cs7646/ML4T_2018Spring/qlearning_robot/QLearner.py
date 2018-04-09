"""
Template for implementing QLearner  (c) 2015 Tucker Balch

PYTHONPATH=../:. python grade_robot_qlearning.py
"""

import numpy as np
import random as rand

class QLearner(object):
    def author(self):
        return 'vla6'

    def __init__(self, \
        num_states=100, \
        num_actions = 4, \
        alpha = 0.2, \
        gamma = 0.9, \
        rar = 0.5, \
        radr = 0.99, \
        dyna = 0, \
        verbose = False):
        """
        rar: Choose random action with probability rar
        radr: Decay rate
        """

        self.verbose = verbose
        self.num_actions = num_actions
        self.s = 0
        self.a = 0
        self.q = np.zeros((num_states, num_actions))

        self.num_states = num_states
        self.num_actions = num_actions
        self.alpha = alpha
        self.gamma = gamma
        self.rar = rar
        self.radr = radr
        self.dyna = dyna
        self.tc = np.zeros((num_states, num_actions, num_states)) + 0.00001


    def querysetstate(self, s):
        """
        @summary: Update the state without updating the Q-table
        @param s: The new state
        @returns: The selected action
        """
        self.s = s

        argmax_actions = np.argmax(self.q, axis=1)
        action = argmax_actions[self.s]

        if self.verbose: print "s =", s,"a =",action
        return action

    def query(self, s_prime, r):
        """
        @summary: Update the Q table and return an action
        @param s_prime: The new state
        @param r: a real valued immediate reward
        @returns: The selected action

        See: https://classroom.udacity.com/courses/ud501/lessons/5247432317/concepts/53538285920923
        """
        if np.random.uniform() <= self.rar:
            """Choose random action with probability rar"""
            action = rand.randint(0, self.num_actions-1)
        else:
            """Choose action that that maximizes Q value given state (0:25 in lecture)"""
            # Choose ArgMax Action
            action = np.argmax(self.q, axis=1)[s_prime]

            # Update Q with s_prime and r
            later_rewards = self.gamma * self.q[s_prime, action]
            self.q[self.s, self.a] = (1 - self.alpha) * self.q[self.s, self.a] + self.alpha * (r + self.gamma * later_rewards)

        # later_rewards = self.gamma * self.q[s_prime, action]
        # self.q[self.s, self.a] = (1 - self.alpha) * self.q[self.s, self.a] + self.alpha * (r + self.gamma * later_rewards)

        if self.verbose: print "s =", s_prime,"a =",action,"r =",r

        # Update rar after each update
        self.rar = self.rar * self.radr

        # Update s and action
        self.s = s_prime
        self.a = action

        # Implementing dyna
        # Update T
        # Update R

        # for d in range(self.dyna):
        #     self.s = np.random.randint(low=0, high=num_states)
        #     self.a = np.random.randint(low=0, high=num_actions)
        #     s_prime = Infer from T
        #     r = self.r[self.s, self.a]

        #     # Update Q
        #     later_rewards = self.gamma * self.q[s_prime, self.a]
        #     self.q[self.s, self.a] = (1 - self.alpha) * self.q[self.s, self.a] + self.alpha * (r + self.gamma * later_rewards)

        return action

if __name__=="__main__":
    print "Remember Q from Star Trek? Well, this isn't him"