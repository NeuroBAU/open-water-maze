//resize images to 128 x 96 px
// optionally images can be passed through a median filter before being resized

// select directory
input = getDirectory("Open directory");
list = getFileList(input);

// create new directory: named as parent directory
output_dir = input + 'small/';
File.makeDirectory(output_dir);

// open all files in the directory
setBatchMode(true); 
for (i = 0; i < list.length; i++){
        open(list[i]);
        run("8-bit");
//        run("Median...", "radius=1"); // optional        
        run("Size...", "width=128 height=96 depth=1 constrain interpolation=Bicubic");
		print(list[i] + '--> DONE!');
		saveAs("PNG", output_dir+'/' + list[i]);
		close();
}

setBatchMode(false);