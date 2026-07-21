
config_path=cfgs/yc2_clip_pdvc.yml
id=yc2
eval_foler=yc2

#training
python train.py --cfg_path ${config_path} --gpu 1 --id ${id} --transformer_input_type 'queries' --num_queries 50

#Evaluation
python eval.py --eval_folder ${eval_folder} --eval_caption_file 'data/yc2/captiondata/yc2_val.json'  --gpu 
