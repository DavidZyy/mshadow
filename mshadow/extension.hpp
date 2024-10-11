/*!
 * Copyright by Contributors
 * \file extension.hpp
 * \brief some extension of expressions,
 *  used to support something beyond elementwise op
 * \author Tianqi Chen, Bing Xu
 */
#ifndef MSHADOW_EXTENSION_H_
#define MSHADOW_EXTENSION_H_
#include "./expr_engine-inl.hpp"
#include "./extension/broadcast.hpp"
#include "./extension/unpack_patch2col.hpp"
#include "./extension/pack_col2patch.hpp"
#include "./extension/reshape.hpp"
#include "./extension/swapaxis.hpp"
#include "./extension/reduceto1d.hpp"
#include "./extension/spatial_pool.hpp"
#include "./extension/spatial_unpool.hpp"
#include "./extension/channel_pool.hpp"
#include "./extension/channel_unpool.hpp"
#include "./extension/pad.hpp"
#include "./extension/crop.hpp"
#include "./extension/mirror.hpp"
#include "./extension/concat.hpp"
#include "./extension/implicit_gemm.hpp"
#include "./extension/choose.hpp"
#include "./extension/fill.hpp"
#include "./extension/one_hot.hpp"
#include "./extension/slice.hpp"
#include "./extension/slice_ex.hpp"
#include "./extension/take.hpp"
#include "./extension/take_grad.hpp"
#include "./extension/reduce_with_axis.hpp"
#include "./extension/broadcast_with_axis.hpp"
#include "./extension/spatial_upsampling_nearest.hpp"
#include "./extension/transpose.hpp"
#include "./extension/flip.hpp"
#include "./extension/complex.hpp"
#include "./extension/range.hpp"
#include "./extension/mask.hpp"
#endif  // MSHADOW_EXTENSION_H_
