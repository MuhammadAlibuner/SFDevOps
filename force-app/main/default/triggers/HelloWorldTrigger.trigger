trigger HelloWorldTrigger on Account (before insert) {
	system.debug('tragger called');
}