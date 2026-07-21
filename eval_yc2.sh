
config_path=cfgs/yc2_clip_pdvc.yml
eval_folder=yc2
python eval.py --eval_folder ${eval_folder} --eval_caption_file 'data/yc2/captiondata/yc2_val.json' --gpu_id 0 --eval_transformer_input_type 'queries'
