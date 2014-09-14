package com.haroel.util
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class MURLLoader extends URLLoader
	{
		public var param:Object;
		public function MURLLoader(request:URLRequest=null)
		{
			super(request);
		}
	}
}