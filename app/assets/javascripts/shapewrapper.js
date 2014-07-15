function shapeWrapper(lineHeight,Xs) {
	var out = '';
	Xvalues = Xs.split('|');
	for(i=0; i < Xvalues.length; i++) {
		parts = Xvalues[i].split(',');
		out += '<div style="float:left;clear:left;height:'+lineHeight+'px;width:'+ parts[1]+'px"></div>';
		out += '<div style="float:right;clear:right;height:'+lineHeight+'px;width:'+ parts[2]+'px"></div>';
	}
  return out;
}
