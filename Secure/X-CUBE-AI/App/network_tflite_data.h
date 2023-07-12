/* Generated file - v1.0
 *
 * Original file         : kws_ref_model.tflite
 */

#ifndef __NETWORK_TFLITE_DATA_H__
#define __NETWORK_TFLITE_DATA_H__

#include <stdint.h>

#ifdef __cplusplus
extern "C"
{
#endif


#undef MAX_LAYER_PARAM
#define MAX_LAYER_PARAM 512*5

extern uint8_t g_tflm_network_model_data[];
extern int g_tflm_network_model_data_len;

extern uint8_t g_tflm_network_model_data_1[];
extern int g_tflm_network_model_data_len_1;
extern uint8_t *current_model_data;
extern uint8_t model_data_buffer[512*5];
extern uint8_t encrypted_network_model_data[MAX_LAYER_PARAM];
extern uint8_t g_tflm_network_model_data_next[MAX_LAYER_PARAM];


#undef TFLM_NETWORK_TENSOR_AREA_SIZE
#define TFLM_NETWORK_TENSOR_AREA_SIZE 24576

#undef TFLM_NETWORK_NAME
#define TFLM_NETWORK_NAME "network"

#undef TFLM_NETWORK_FILE_NAME
#define TFLM_NETWORK_FILE_NAME "kws_ref_model"

#ifdef __cplusplus
}
#endif
#endif /* __NETWORK_TFLITE_DATA_H__ */
