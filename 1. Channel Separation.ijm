dir = getDirectory("Choose a Directory ");
list = getFileList(dir);
run("Clear Results");
for (n=0; n<list.length; n++) {
	if (endsWith(list[n], ".czi")){	
    	bf_in_str = "open=[" + dir + list[n] + "] autoscale color_mode=Colorized rois_import=[ROI manager] split_channels view=Hyperstack stack_order=XYCZT";
    	run("Bio-Formats Importer", bf_in_str); 
    	
		// For DAPI 
		selectWindow(list[n] + " - C=0");
		run("Enhance Contrast", "saturated=0.35");
		run("8-bit");
		bf_out_str = dir + "/result/"+ list[n]+"_DAPI";
		saveAs("Tiff", bf_out_str);
		
		// For GFAP 
		selectWindow(list[n] + " - C=1");
		run("Enhance Contrast", "saturated=0.35");
		run("8-bit");
		bf_out_str = dir + "/result/"+ list[n]+"_GFAP";
		saveAs("Tiff", bf_out_str);

		// For Iba1 
		selectWindow(list[n] + " - C=2");
		run("Enhance Contrast", "saturated=0.35");
		run("8-bit");
		bf_out_str = dir + "/result/"+ list[n]+"_Iba1";
		saveAs("Tiff", bf_out_str);

		// For TnC 
		selectWindow(list[n] + " - C=3");
		run("Enhance Contrast", "saturated=0.35");
		run("8-bit");
		bf_out_str = dir + "/result/"+ list[n]+"_TnC";
		saveAs("Tiff", bf_out_str);

		
		run("Close All");
		
		
	   	
  	}
}  	

