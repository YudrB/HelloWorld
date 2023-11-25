#include <iostream>
#include <memory>
#include "../../HelloLib/HelloLib.h"

using namespace std;

int main()
{
	unique_ptr<HelloLib> helloLib = make_unique<HelloLib>();
	cout << helloLib->getHelloWorldString() << endl;
	return 0;
}
