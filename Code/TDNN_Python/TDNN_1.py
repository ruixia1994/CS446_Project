
#import file_io_test as fio
import tensorflow as tf
import numpy as np
import random

import itertools
from plot_confusion_matrix import plot_confusion_matrix

import matplotlib as mpl
mpl.use('Agg')

import matplotlib.pyplot as plt

from sklearn.metrics import confusion_matrix

alpha = 0.1 # learning rate
smallBatch= 200
sess = tf.InteractiveSession()

#Input the data


y_train = []
x_train = []
y_test = []
x_test = []
lines=[]

def shuffle(y, data_set):
    x_shuffled = data_set
    y_shuffled = y
    idx = [x for x in range(0, len(y))]
    random.shuffle(idx)
    i = 0
    for j in idx:
        x_shuffled[i] = data_set[int(j)]
        y_shuffled[i] = y[int(j)]
        i += 1
    return y_shuffled, x_shuffled


fio=open('XTrainPrint.txt',"r")
for line in fio.readlines():
    lines=line.split()
    x_train.append(lines)
print(np.shape(x_train))


fio=open('YTrainPrint.txt',"r")
for line in fio.readlines():
    lines=line.split()
    y_train.append(lines)
print(np.shape(y_train))

fio=open('XTest.txt',"r")
for line in fio.readlines():
    lines=line.split()
    x_test.append(lines)
print(np.shape(x_test))

fio=open('YTest.txt',"r")
for line in fio.readlines():
    lines=line.split()
    y_test.append(lines)
print(np.shape(y_test))


y_train, x_train=shuffle(y_train,x_train)

m,n =np.shape(x_train)

# dataset x and label set y
x = tf.placeholder(tf.float32, [None, 4096])
y = tf.placeholder(tf.float32, [None, 30])


# weight initialization function
def weight_variable(shape):
    initial = tf.truncated_normal(shape, stddev=0.1)
    return tf.Variable(initial)


def bias_variable(shape):
    initial = tf.constant(0.1, shape=shape)
    return tf.Variable(initial)



def conv2d(x, W):
    return tf.nn.conv2d(x, W, strides=[1, 1, 1, 1], padding='VALID')

# def max_pool_2x2(x):
#   return tf.nn.max_pool(x, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding='SAME')


x_image = tf.reshape(x, shape=[-1, 64, 64, 1])  # reshape input

#Input layer: (J=16, N=2), Hidden Layer 1: (J=8, N=4), Hidden Layer 2: (J=3, N=1), Final Layer: multi-class logistic regression.

# first layer
#W_conv2 = weight_variable([5, 5, 32, 64]) 5*5 patch 64 features
W_conv1 = weight_variable([5, 64, 1, 8])
b_conv1 = bias_variable([8])
h_conv1 = tf.nn.sigmoid(conv2d(x_image, W_conv1) + b_conv1)
# h_pool1 = max_pool_2x2(h_conv1)
print(h_conv1)


# second  layer
W_conv2 = weight_variable([5, 1, 8, 3])
b_conv2 = bias_variable([3])
h_conv2 = tf.nn.sigmoid(conv2d(h_conv1, W_conv2) + b_conv2)
# h_pool2 = max_pool_2x2(h_conv2)



# Third  layer
W_conv3 = weight_variable([2, 1, 3, 30])
b_conv3 = bias_variable([30])
h_conv3 = tf.nn.sigmoid(conv2d(h_conv2, W_conv3) + b_conv3)


# Fully Connected
# W_fc1 = weight_variable([7 * 7 * 64, 1024])
# b_fc1 = bias_variable([1024])

# h_pool2_flat = tf.reshape(h_pool2, [-1, 7 * 7 * 64])
# h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)

#Dropout, avoid the overfitting
#keep_prob = tf.placeholder(tf.float32)
# h_fc1_drop = tf.nn.dropout(h_fc1, kee
# #Readout Layer
# W_fc2 = weight_variable([1024, n1])
# b_fc2 = bias_variable([n1])

# final layer softmax
y_output = tf.reduce_sum(h_conv3, 1)
y_hat = tf.nn.softmax(tf.reshape(y_output, [-1, 30]))



#Train
cross_entropy = tf.reduce_mean(-tf.reduce_sum(y * tf.log(y_hat),reduction_indices=[1]))
train_step = tf.train.GradientDescentOptimizer(alpha).minimize(cross_entropy)


#Evaluation

correct_prediction = tf.equal(tf.argmax(y_hat, 1), tf.argmax(y,1))
accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))


sess.run(tf.initialize_all_variables())


for i in range(2000):

    if i % 50 == 0:
        train_accuracy = accuracy.eval(feed_dict={x: x_train,y: y_train})
        print("step %d, training accuracy %g" % (i, train_accuracy))


    # mini-batch gradient descent
    for start in np.arange(0, m, smallBatch):# batch size
        data_batch = x_train[start:start + 218]
        label_batch = y_train[start:start + 218]
        train_step.run(feed_dict={x: data_batch, y: label_batch})

weight_1=sess.run(W_conv1)
np.save("weight_1",weight_1)
weight_2=sess.run(W_conv2)
np.save("weight_2",weight_2)
weight_3=sess.run(W_conv3)
np.save("weight_3",weight_3)

bias_1=sess.run(b_conv1)
np.save("bias_1",bias_1)
bias_2=sess.run(b_conv2)
np.save("bias_2",bias_2)
bias_3=sess.run(b_conv3)
np.save("bias_3",bias_3)
# test_accuracy = accuracy.eval(feed_dict={x: x_test, y: y_test})


# print("test accuracy %g" % test_accuracy)



# confusion_matrix = tf.contrib.metrics.confusion_matrix(tf.argmax(y_hat, 1), tf.argmax(y,1))
# cm = confusion_matrix.eval(feed_dict = {x: x_test,y: y_test})


# # print(type(y_pred))
# #
# # label = []
# # for i in range(len(y_test)):
# #     label.append(np.argmax(y_test[i]))
# #
# # print(label)
# #
# # test = []
# # for i in  range(len(y_pred)):
# #     test.append(np.argmax(y_pred))
# # print(test)
# #

# index = ['0', '1', '2', '3','4','5','6','7','8','9']
# np.set_printoptions(precision=2)
# plt.figure()
# plot_confusion_matrix(cm, index, title='Confusion matrix')
# plt.show()
