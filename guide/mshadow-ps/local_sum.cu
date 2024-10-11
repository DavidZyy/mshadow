#include "./local_sum-inl.hpp"
int main(int argc, char *argv[]) {
  return Run<mshadow::gpu>(argc, argv);
}
