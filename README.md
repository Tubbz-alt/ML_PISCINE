# ML_PISCINE
42 Silicon Valley Machine Learning Piscine (Tensorflow)

Tested on GCP instance with 1 x NVIDIA Tesla K80 GPU, 6 vCPUs and 39 GB memory, Debian 9.6

Requires installing GNU Parallel for projects requiring use of sox: sudo apt install parallel

Requires opening ports: 6006 (Tensorboard), 8888-8889 (Jupyter), 80 (http), 443 (https)

Python version: 3.6.6, full conda environment is available for cloning from environment.yml

To recreate conda environment (Conda version: 4.5.11): conda env create -f environment.yml

To track custom estimator's behavior: 

  -activate conda environment in bash: source activate environment_name
  
  -run in bash: "tensorboard --logdir replace_with_working_dir_from_jupyter"
  
  -go to http://ip.of.your.instance:6006, wait until tensorboard saves summary steps and refresh the browser
  


