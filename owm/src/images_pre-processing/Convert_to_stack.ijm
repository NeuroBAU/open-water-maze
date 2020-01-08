// select directory
input = getDirectory("Open directory");
//print(input);
list = getFileList(input);


// open all files in the directory
setBatchMode(true); 
for (i = 0; i < list.length; i++){
        //print(list[i]);
        open(list[i]);
}


// create new directory: named as parent directory
output_dir = input + 'stack/';
//print(output_dir)
File.makeDirectory(output_dir);

// process into stack
run("Images to Stack");
run("8-bit");

// save it to new folder
saveAs("Tiff", output_dir+'/'+File.getName(input));
close();
setBatchMode(false); 

fname = File.getName(input);
print(fname + '--> DONE!');




