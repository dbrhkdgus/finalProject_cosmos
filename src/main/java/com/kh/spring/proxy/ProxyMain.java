package com.kh.spring.proxy;

public class ProxyMain {
	public static void main(String[] args) {
		/**
		 * FooImpl 개발한 클래스
		 * FooProxy spring container에 의해 생성/주입된 proxy 객체
		 */
		Foo foo = new FooProxy(new FooImpl());
		String name = foo.getName();
		System.out.println(name);
	}
}
