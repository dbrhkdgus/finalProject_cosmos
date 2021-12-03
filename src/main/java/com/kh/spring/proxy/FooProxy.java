package com.kh.spring.proxy;

public class FooProxy implements Foo {
	
	private Foo foo;
	
	public FooProxy(Foo foo) {
		this.foo = foo;
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		System.out.println("getName 호출 전");
		String name = foo.getName();
		System.out.println("getName 호출 후");
		return name;
	}

}
