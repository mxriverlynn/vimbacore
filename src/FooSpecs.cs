using NUnit.Framework;
using System;

[TestFixture]
public class When_testing_out_my_vimfu_skillz
{
  [Test]
  public void should_find_them_to_be_mad()
  {
    var foo = new Foo();
    Assert.AreEqual(1, foo.Bar());
  }
}
