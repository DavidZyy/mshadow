#include "mshadow/tensor.hpp"
#include "old/tensor.hpp"
#include "assert.hpp"
#include <cstring>

using mshadow::index_t;
template<typename T>
void Print(T const & ist) {
  for (int i = 0; i < ist.size(0); ++i) {
    for (int j = 0; j < ist.size(1); ++j) {
      printf("%.2f ", ist[i][j]);
    }
    printf("\n");
  }
}

bool Check(mshadow::TensorContainer<mshadow::cpu, 2, float> &mct, \
           Xmshadow::TensorContainer<Xmshadow::cpu, 2> &xct) {
  for (index_t i = 0; i < mct.size(0); ++i) {
    for (index_t j = 0; j < mct.size(1); ++j) {
      assert(mct[i][j] == xct[i][j]);
    }
  }
  return true;
}

template<typename xpua, typename xpub>
void RunTask() {
  const int X = 6;
  const int K = 2;
  mshadow::TensorContainer<mshadow::cpu, 2, float> srcm(mshadow::Shape2(X, X));
  Xmshadow::TensorContainer<Xmshadow::cpu, 2> srcx(Xmshadow::Shape2(X, X));
  
  mshadow::TensorContainer<xpua, 2, float> mct(mshadow::Shape2(X, X));
  Xmshadow::TensorContainer<xpub, 2> xct(Xmshadow::Shape2(X, X));
  for (int i = 0; i < X; ++i) {
    for (int j = 0; j < X; ++j) {
      srcm[i][j] = i * 0.1f + j * 0.1f;
      srcx[i][j] = i * 0.1f + j * 0.1f;
    }
  }
  mshadow::Copy(mct, srcm);
  Xmshadow::Copy(xct, srcx);
  mshadow::TensorContainer<xpua, 2, float> pool_ct(mshadow::Shape2((X-K)/2+1, (X-K)/2+1));
  Xmshadow::TensorContainer<xpub, 2> pool_xct(Xmshadow::Shape2((X-K)/2+1, (X-K)/2+1));

  pool_ct = mshadow::expr::pool<mshadow::red::maximum>(mct, K, K, K);
  pool_xct = Xmshadow::expr::pool<Xmshadow::red::maximum>(xct, K, K);

  mshadow::TensorContainer<mshadow::cpu, 2, float> cpool_ct(mshadow::Shape2((X-K)/2+1, (X-K)/2+1));
  Xmshadow::TensorContainer<Xmshadow::cpu, 2> cpool_xct(Xmshadow::Shape2((X-K)/2+1, (X-K)/2+1));
  mshadow::Copy(cpool_ct, pool_ct);
  Xmshadow::Copy(cpool_xct, pool_xct);
  if (Check(cpool_ct, cpool_xct)) {
    printf("Pass\n");
  }
}

int main(int argc, char** argv) {
  if (argc < 2) {
    printf("Usage: dev\n");
    exit(-1);
  }
  if (!strcmp(argv[1], "cpu")) {
    RunTask<mshadow::cpu, Xmshadow::cpu>();
  } else {
    RunTask<mshadow::gpu, Xmshadow::gpu>();
  }
}