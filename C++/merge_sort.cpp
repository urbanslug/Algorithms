#include <vector>
#include <math.h>

using std::vector;
using namespace std;

vector<int> merge(vector<int> a, vector<int> b){
  int a_len = a.size();
  int b_len = b.size();
  int n = a_len + b_len;
  vector<int> c(n);

  for(int i=0, j=0, k=0;i<n;i++){
    if (k >= b_len || (a[j] < b[k] and j<a_len)){
      c[i] = a[j];
      j=j+1;
    } else {
      c[i] = b[k];
      k=k+1;
    }
  }

  return c;
}

vector<int> merge_sort(vector<int> b){
  if (b.size() <= 1) {
    return b;
  } else {

    int midpoint = floor(b.size()/2);
    vector<int> left;
    vector<int> right;

    left.insert(left.begin(), b.begin(), b.begin()+midpoint);
    right.insert(right.begin(), b.begin()+midpoint, b.end());

    return merge(merge_sort(left), merge_sort(right));
  }
}
