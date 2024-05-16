#include <iostream>
#include <vector>

std::vector<int> solution(std::vector<int> &A,int K){
	for(int i=0 ; i<K; i++ )
	{ 
		int temp = A.back();
		A.pop_back();
		A.insert(A.begin(),temp);
	}
	return A;
}

int main(){
	std::vector<int> test = {1, 2, 3, 4};
	int K = 4;
	std::vector<int> sol = solution(test, K);

	for(auto i: sol)
		std::cout << i << "";

	return 0;
}
