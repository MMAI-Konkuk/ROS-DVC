# ROS-DVC

Official implementation for Stay in your Lane: Role Specific Queries with Overlap Suppression Loss for Dense Video Captioning (CVPR 2026)

[[paper]]()

## Introduction
ROS-DVC is a simple but effective end-to-end dense video captioning framework that  utilize role-specific queries that separate localization and captioning into independent components, allowing each to exclusively learn its role.
To ensure semantic alignment between these decoupled representations, we introduce the Cross-Task Contrastive Alignment (CTCA) Loss. To mitigate the query overlap problem, we introduce a novel Overlap Suppression Loss that explicitly penalizes query pairs that overlap excessively based on pairwise IoU between the queries. 
![ROS](ROS.jpg)

## Preparation
Environment: Linux,  GCC>=5.4, CUDA >= 9.2, Python>=3.7, PyTorch>=1.5.1

1. Create virtual environment by conda
```bash
conda create -n ROS python=3.7
source activate ROS
conda install pytorch==1.7.1 torchvision==0.8.2 cudatoolkit=10.1 -c pytorch
conda install ffmpeg
pip install -r requirement.txt
```

2. Compile the deformable attention layer (requires GCC >= 5.4). 
```bash
cd rosdvc/ops
sh make.sh
```

3. Prepare Dataset

you can get CLIP features of Youcook2 and ActivityNet captions from [here](https://github.com/ailab-kyunghee/CM2_DVC/tree/master?tab=readme-ov-file)

## Training and Validation

```
# Training
config_path=cfgs/yc2.yml
python train.py --cfg_path ${config_path} --gpu_id ${GPU_ID}
# The script will evaluate the model for every epoch. The results and logs are saved in `./save`.

# Evaluation
eval_folder={eval_folder_path} # specify the folder to be evaluated
python eval.py --eval_folder ${eval_folder} --eval_transformer_input_type queries --gpu_id ${GPU_ID}
```


## Acknowledgement

The implementation of Deformable Transformer is mainly based on [Deformable DETR](https://github.com/fundamentalvision/Deformable-DETR). 
The implementation of the captioning head is based on [ImageCaptioning.pytorch](https://github.com/ruotianluo/ImageCaptioning.pytorch).
The overall pipeline implementation is mainly based on [PDVC](https://github.com/ttengwang/PDVC).
We also utilize the pre-extracted clip features and dataset preparation provided by [CM2-DVC](https://github.com/ailab-kyunghee/CM2_DVC).
We thank the authors of these projects for making their code and resources publicly available.
