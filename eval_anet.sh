
config_path=cfgs/anet_clip_pdvc.yml
eval_folder=anet
python eval.py --eval_caption_file 'data/anet/captiondata/val_1.json' --eval_folder ${eval_folder}