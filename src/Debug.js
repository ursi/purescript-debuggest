exports.log = a => {
	console.log(a);
	return a;
};

exports.logShowImpl = show => a => {
	console.log(show(a));
	return a;
};

exports.taggedLogImpl = str => a => {
	console.log(str, a);
	return a;
};

exports.taggedLogShowImpl = show => str => a => {
	console.log(str, show(a));
	return a;
};

exports.debugger = a => {
	debugger;
	return a;
};
