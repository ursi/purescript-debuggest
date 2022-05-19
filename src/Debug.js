exports const debugger = a => {
	debugger;
	return a;
};

exports const dir = a => {
	console.dir(a);
	return a;
};

exports const log = a => {
	console.log(a);
	return a;
};

exports const logShowImpl = show => a => {
	console.log(show(a));
	return a;
};

exports const taggedLogImpl = str => a => {
	console.log(str, a);
	return a;
};

exports const taggedLogShowImpl = show => str => a => {
	console.log(str, show(a));
	return a;
};

exports const todoImpl = () => {
	throw `You have used "Debug.todo" somewhere in your code. Remove it or use "Debug.unsafeTodo" to stop this error.`;
};
