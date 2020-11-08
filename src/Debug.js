exports.debugger = a => {
	debugger;
	return a;
};

exports.dir = a => {
	console.dir(a);
	return a;
};

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

exports.todoImpl = () => {
	throw `You have used "Debug.todo" somewhere in your code. Remove it or use "Debug.unsafeTodo" to stop this error.`;
};
