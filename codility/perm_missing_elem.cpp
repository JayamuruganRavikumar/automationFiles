#include <iostream>
#include <vector>
#include <bits/stdc++.h>

int solution(std::vector<int> &A){
	sort(A.begin(),A.end());
	int missing;
	for(int i=0; i<A.size(); i++){
		if(A[i]!=i+1){
			missing = i+1;
		}
	}

	return missing;
}

int main(){
	std::vector<int> A = {2, 3, 1, 5};
	return solution(A);
}

