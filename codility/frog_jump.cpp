#include <iostream>

int solution(int x, int y, int d){
	int dist = x - y;
	int div = abs(dist)/d;
	if (abs(dist)%d > 0){
		div+=1;
	}
	return div;
}
int main(){
	int ans = solution(10, 85, 30);
	std::cout << ans; 
	return 0;
}


