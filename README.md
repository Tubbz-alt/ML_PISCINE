# 42 Silicon Valley Machine Learning Piscine (Tensorflow)

Tested on GCP instance with 1 x NVIDIA Tesla K80 GPU, 6 vCPUs and 39 GB memory, Debian 9.6

Requires opening ports: 6006 (Tensorboard), 8888-8889 (Jupyter), 80 (http), 443 (https)

Python version: 3.6.6, full conda environment is available for cloning from environment.yml

Conda version: 4.5.11

Required bash actions:
```sh
sudo apt install parallel
sudo apt install unzip
conda env create -f environment.yml
source activate 42
jupyter notebook --ip=0.0.0.0
```

To track custom estimator's behavior:

```sh
source activate 42
tensorboard --logdir replace_with_working_dir_from_jupyter
```

* go to http://ip.of.your.instance:6006, wait until tensorboard saves summary steps and refresh the browser
* type "accuracy" in Tensorboard search field on top to display both training and validation accuracies side by side


## tmux

It is very helpful to use tmux to split SSH terminal screen in 3 panes and run jupyter in one pane, tensorboard in second and have the third one for bash commands when you need it.

Optional bash actions:
```sh
sudo apt install tmux
tmux
```

#### tmux commands:

* <kbd>ctrl</kbd>+<kbd>b</kbd>+<kbd>"</kbd> -> split terminal window horizontally x 3
* <kbd>ctrl</kbd>+<kbd>b</kbd>+<kbd>up</kbd> -> make the pane on top of current one active
* <kbd>ctrl</kbd>+<kbd>b</kbd>+<kbd>down</kbd> -> make the pane on bottom of current one active
* <kbd>ctrl</kbd>+<kbd>b</kbd>+<kbd>d</kbd> -> detach from tmux screen

Restore running tmux window, if you detach from tmux screen or close ssh window:
```sh
tmux a #
```
### Projects:

#### Kaggle MNIST

#### Kaggle Housing Price Prediction

#### Kaggle Titanic

#### Kaggle Airbus Ship Detection

#### Kaggle Tensorflow Speech Recognition

#### 42 Subvocalization final project

* Data should be in ./data/subvocalization/
