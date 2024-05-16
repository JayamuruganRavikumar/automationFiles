#include <iostream>
#include <vector>
#include <bits/stdc++.h>

int solution(std::vector<int> &A){
	sort(A.begin(),A.end());
	for(int i=0; i<A.size(); i+=2){
		if(A[i]!=A[i+1] && i+1<A.size()){
			std::cout<< A[i];
			break;
		}
	}
	return 0;
}

int main(){
	std::vector<int> A = {9, 3, 9, 3, 9, 7, 9};
	solution(A);

}
