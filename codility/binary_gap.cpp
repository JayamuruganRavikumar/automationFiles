#include <bits/stdc++.h>
using namespace std;

string DecimalToBinary(int num)
{
    string str;
	string str_rev="";
	int str_size;
      while(num){
      if(num & 1) // check if the LSB is 1
        str+='1';
      else // if LSB is 0
        str+='0';
      num>>=1; // Right Shift by 1 
    }    
	str_size=str.size()-1;

	for(int i=str_size ; i>=0 ; i--)
	{ 
		str_rev+=str[i];
	}
	return str_rev;
}


int main() {
	int num;
	cout<<"Enter a number: \n";
	cin>>num;
    
	int j=1;
	int count=0;
    string number = DecimalToBinary(num);
	cout<<"The decimal number is\n";
	cout<<number;
	for(int i=0; i<number.size(); i++)
	{
		if(number[i]=='1')
		{
			while(number[i+j]=='0' && i+j<number.size()){
				j++;
			}
			i+=j-1;
			if(count<j){
				count=j-1;
			}
		}
		j=1;
	}
	cout<<"\n";
	cout<<count; 

    return 0;
}


