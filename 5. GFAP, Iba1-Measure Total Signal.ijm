dir = getDirectory("Choose a Directory ");
list = getFileList(dir);
run("Clear Results");
for (n=0; n<list.length; n++) {
	if (endsWith(list[n], ".tiff")){	
    	bf_in_str = "open=[" + dir + list[n] + "] autoscale color_mode=Colorized rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT";
    	run("Bio-Formats Importer", bf_in_str); 
    	
		run("Set Measurements...", "area integrated display redirect=None decimal=0");

    	
		// Do the same for every composed (ilastik mask) picture per staining
		selectWindow(list[n] + " - C=0");
		run("Make Binary");
		run("Create Selection");
		run("Measure");
		
		
		run("Close All");
  	}
}  	
		
		