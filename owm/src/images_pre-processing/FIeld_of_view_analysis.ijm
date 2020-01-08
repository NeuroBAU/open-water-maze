// clean up ROI manager
if (roiManager("count")>0){
	roiManager("Delete");
}

// open stack
f = File.openDialog("Choose stack to Open");
open(f);

// Zoom out and process
run("Out [-]");
run("Median...", "radius=4 stack");
run("Find Edges", "stack");
setMinAndMax(10, 60);

// Define field of view
makeRectangle(293, 0, 1054, 1232);
run("Make Inverse");
roiManager("Add");
//roiManager("Set Fill Color", "#1af2ff00");
roiManager("Show All");

// image parameters
getDimensions(width, height, channels, slices, frames);

quadrant_name = getInfo("image.filename");
if (lengthOf(quadrant_name)>5){
	quadrant_number=substring(quadrant_name,0,2);
}
else{
	quadrant_number=substring(quadrant_name,0,1);
}


// feature labels
labels = newArray('<Ceiling','Ceiling','Ceiling>','<Pole','Pole','Pole>','<Box','Box','Box>','<Corner','Corner','Corner>','<Curtain','Curtain','Curtain>','<Coffee','Coffee','Coffee>','<Plus','Plus','Plus>','<H.stripes','H.stripes','H.stripes>','<V.stripes','V.stripes','V.stripes>');

// Dialog checkboxes parameters
rows = labels.length/3;
columns = 3;
defaults = newArray(rows*columns);

for (slice_number=1; slice_number<=slices; slice_number++) {
	slice_results = newArray(rows*columns);
	Dialog.create("Checkbox Group");
	Dialog.addMessage("< LEFT         |       CENTER       |        RIGHT>");
	Dialog.addCheckboxGroup(rows,columns,labels,defaults);
	Dialog.show();
	
	slice_name = getInfo("slice.label");
	degree = substring(slice_name,5,lengthOf(slice_name));
	setResult("File.name", slice_number-1, slice_name);
	setResult("Quadrant", slice_number-1, quadrant_number);
	setResult("Degree", slice_number-1, degree);
	
	
	// add results to temp array
	for (i=0; i<labels.length; i++){
		slice_results[i] = Dialog.getCheckbox();
		//setResult(labels[i], slice_number-1, Dialog.getCheckbox());
	}
	for (i=0; i<slice_results.length; i+=3){
		setResult(labels[i], slice_number-1, slice_results[i]);
	}
	for (i=1; i<slice_results.length; i+=3){
		setResult(labels[i], slice_number-1,slice_results[i]);
	}		
	for (i=2; i<slice_results.length; i+=3){
		setResult(labels[i], slice_number-1, slice_results[i]);
	}
	
	updateResults();
	run("Next Slice [>]");
}