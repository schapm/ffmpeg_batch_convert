# FFmpeg Batch Convert

This BASH script was made to batch convert videos organised in two levels of directories into audio files - namely video courses.

For example;
```
- Part_1
  - Sub_Folder_1
    - Part_1_Video_1.mp4
    - Part_1_Video_2.mp4
  - Sub_Folder_2
	  - Part_1_Video_3.mp4
	  - Part_1_Video_4.mp4
```

Any supported input and output file extensions supported by FFmpeg can be specified, such as mov, mp4, m4a, 3gp.

## Usage
### Minimum Options
`git clone https://github.com/schapm/ffmpeg_batch_convert.git`

`chmod +x $HOME/ffmpeg_batch_convert/ffmpeg_batch_convert.sh`

`cd $HOME/Videos/Part_1`

`$HOME/ffmpeg_batch_convert/ffmpeg_batch_convert.sh -i "mp4" -o "mp3"`

### Specify Input Directory
`git clone https://github.com/schapm/ffmpeg_batch_convert.git`

`chmod +x $HOME/ffmpeg_batch_convert/ffmpeg_batch_convert.sh`

`$HOME/ffmpeg_batch_convert/ffmpeg_batch_convert.sh -i "mp4" -o "mp3" -n "$HOME/Videos/Part_1"`

## License
Licensed under the [GNU GPLv3](LICENSE).