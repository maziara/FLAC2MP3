# FLAC2MP3
Converting FLAC files to VBR MP3 and conserving all the tags.

This script finds all the files with FLAC extensions in the current directory (and its decendants) and then converts them to MP3, conserving all the tag info.

It also includes the 'cover.jpg' files into the converted files as cover photo from their respective folder.

It requires the 'libav' package. On ubuntu you can do:
```
sudo apt-get install libav-tools
```

To use it, simply clone the repository, and run the script from the folder all your FLAC files reside. Like below:

```
cd ~
git clone https://github.com/maziara/FLAC2MP3.git
chmod +x FLAC2MP3/flac2mp3.sh
cd ToMyMusicFilesThatNeedToBeConvertedToMP3
~/FLAC2MP3/flac2mp3.sh
```

After you're done with the conversion, and happy :) .... FLAC files can be removed at once with the following command from the same folder:

```
find -iname "*.flac" -delete
```

Enjoy.
