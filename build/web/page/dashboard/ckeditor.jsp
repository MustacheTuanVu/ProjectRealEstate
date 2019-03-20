<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
 * CKFinder
 * ========
 * http://cksource.com/ckfinder
 * Copyright (C) 2007-2015, CKSource - Frederico Knabben. All rights reserved.
 *
 * The software, this file and its contents are subject to the CKFinder
 * License. Please read the license.txt file before using, installing, copying,
 * modifying or distribute this file or part of its contents. The contents of
 * this file is part of the Source Code of CKFinder.
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>CKFinder - Sample - CKEditor Integration</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex, nofollow" />
	<link href="<%=request.getContextPath()%>/ckfinder/sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
</head>
<body>
	
	<p>
		<textarea id="editor1" name="editor1" rows="10" cols="80"></textarea>
	</p>
	
	<script src="//cdn.ckeditor.com/4.5.6/standard-all/ckeditor.js"></script>
	<script>
		// Note: in this sample we use CKEditor with two extra plugins:
		// - uploadimage to support pasting and dragging images,
		// - image2 (instead of image) to provide images with captions.
		// Additionally, the CSS style for the editing area has been slightly modified to provide responsive images during editing.
		// All these modifications are not required by CKFinder, they just provide better user experience.
		if ( typeof CKEDITOR !== 'undefined' ) {
			CKEDITOR.addCss( 'img {max-width:100%; height: auto;}' );
			var editor = CKEDITOR.replace( 'editor1', {
				extraPlugins: 'uploadimage,image2',
				removePlugins: 'image',
				height:350
			} );

			// Just call CKFinder.setupCKEditor and pass the CKEditor instance as the first argument.
			// The second parameter (optional), is the path for the CKFinder installation (default = "/ckfinder/").
			// NOTE POINT
                        CKFinder.setupCKEditor( editor, { basePath : '<%=request.getContextPath()%>/ckfinder/'} ) ;

			// It is also possible to pass an object with selected CKFinder properties as a second argument.
			// CKFinder.setupCKEditor( editor, { basePath : '../', skin : 'v1' } ) ;
		} else {
			document.getElementById( 'description' ).innerHTML = '<div class="tip-a tip-a-alert">This sample requires working Internet connection to load CKEditor from CDN.</div>'
		}
	</script>
</body>
</html>
