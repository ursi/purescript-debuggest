const debugger_ = a => {
	debugger;
	return a;
};

export { debugger_ as debugger }

export const dir = a => {
	console.dir(a);
	return a;
};

export const log = a => {
	console.log(a);
	return a;
};

export const logShowImpl = show => a => {
	console.log(show(a));
	return a;
};

export const taggedLogImpl = str => a => {
	console.log(str, a);
	return a;
};

export const taggedLogShowImpl = show => str => a => {
	console.log(str, show(a));
	return a;
};

export const todoImpl = () => {
	throw `You have used "Debug.todo" somewhere in your code. Remove it or use "Debug.unsafeTodo" to stop this error.`;
};
