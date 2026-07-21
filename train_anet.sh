
config_path=cfgs/anet_clip_pdvc.yml
id=anet
eval_folder=anet

#Training
python train.py --cfg_path ${config_path} --id ${id} --transformer_input_type 'queries' --num_queries 10

#Evaluation
python eval.py --eval_folder ${eval_folder} --eval_caption_file 'data/anet/captiondata/val_1.json'  
