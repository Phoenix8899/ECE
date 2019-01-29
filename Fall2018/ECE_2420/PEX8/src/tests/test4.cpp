#include <iostream>
#include "include.hpp"

int main()
{
#include "instantiate.hpp"

  //populate
  inner.insert("one", 1);
  inner.insert("two", 2);
  outer.insert("outer1", inner);
  outer.insert("outer2", inner);
  inner.del("one");
  inner.del("two");

 auto outer1 = outer.get("outer1");
 auto outer2 = outer.get("outer2");
  
  outer1->del("one");
  outer2->del("two");

  outer.forEach([](const std::string &key, KeyVal<std::string, int> &val){
    std::cout << key;
    val.forEach([](const std::string &key, int &val){
      std::cout << key << val;
    });
  });

}
