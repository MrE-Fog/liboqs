# SPDX-License-Identifier: MIT

include(CMakeDependentOption)

if(NOT DEFINED OQS_KEM_DEFAULT)
    set(OQS_KEM_DEFAULT "OQS_KEM_alg_frodokem_640_aes")
endif()
if(NOT DEFINED OQS_SIG_DEFAULT)
    set(OQS_SIG_DEFAULT "OQS_SIG_alg_dilithium_2")
endif()

# Only enable OpenSSL by default on not-Windows
if(NOT WIN32)
    option(OQS_USE_OPENSSL "Enable OpenSSL usage" ON)
else()
    option(OQS_USE_OPENSSL "Enable OpenSSL usage" OFF)
endif()
cmake_dependent_option(OQS_USE_AES_OPENSSL "" ON "OQS_USE_OPENSSL" OFF)
cmake_dependent_option(OQS_USE_SHA2_OPENSSL "" ON "OQS_USE_OPENSSL" OFF)
# Disable OpenSSL's SHA3 by default. The implementation is not complete
# enough to support our incremental API.
cmake_dependent_option(OQS_USE_SHA3_OPENSSL "" OFF "OQS_USE_OPENSSL" OFF)

if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR OQS_USE_AVX2_INSTRUCTIONS)
    cmake_dependent_option(OQS_ENABLE_SHA3_xkcp_low_avx2 "" ON "NOT OQS_USE_SHA3_OPENSSL" OFF)
endif()
endif()

# BIKE is not supported on Windows
cmake_dependent_option(OQS_ENABLE_KEM_BIKE "Enable BIKE algorithm family" ON "NOT WIN32" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_bike1_l1_cpa "" ON "OQS_ENABLE_KEM_BIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_bike1_l1_fo "" ON "OQS_ENABLE_KEM_BIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_bike1_l3_cpa "" ON "OQS_ENABLE_KEM_BIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_bike1_l3_fo "" ON "OQS_ENABLE_KEM_BIKE" OFF)

option(OQS_ENABLE_KEM_FRODOKEM "Enable Frodo algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_640_aes "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_640_shake "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_976_aes "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_976_shake "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_1344_aes "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_frodokem_1344_shake "" ON "OQS_ENABLE_KEM_FRODOKEM" OFF)

option(OQS_ENABLE_KEM_SIKE "Enable SIKE algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p434 "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p434_compressed "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p503 "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p503_compressed "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p610 "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p610_compressed "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p751 "" ON "OQS_ENABLE_KEM_SIKE" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sike_p751_compressed "" ON "OQS_ENABLE_KEM_SIKE" OFF)

option(OQS_ENABLE_KEM_SIDH "Enable SIDH algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p434 "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p434_compressed "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p503 "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p503_compressed "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p610 "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p610_compressed "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p751 "" ON "OQS_ENABLE_KEM_SIDH" OFF)
cmake_dependent_option(OQS_ENABLE_KEM_sidh_p751_compressed "" ON "OQS_ENABLE_KEM_SIDH" OFF)

option(OQS_ENABLE_SIG_PICNIC "Enable Picnic algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L1_UR "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L1_FS "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L1_full "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L3_UR "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L3_FS "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L3_full "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L5_UR "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L5_FS "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic_L5_full "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic3_L1 "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic3_L3 "" ON "OQS_ENABLE_SIG_PICNIC" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_picnic3_L5 "" ON "OQS_ENABLE_SIG_PICNIC" OFF)

##### OQS_COPY_FROM_UPSTREAM_FRAGMENT_ADD_ENABLE_BY_ALG_START
option(OQS_ENABLE_KEM_CLASSIC_MCELIECE "Enable classic_mceliece algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_348864 "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_348864_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_348864" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_348864f "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_348864f_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_348864f" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_460896 "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_460896_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_460896" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_460896f "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_460896f_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_460896f" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6688128 "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6688128_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_6688128" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6688128f "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6688128f_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_6688128f" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6960119 "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6960119_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_6960119" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6960119f "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_6960119f_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_6960119f" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_8192128 "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_8192128_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_8192128" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_8192128f "" ON "OQS_ENABLE_KEM_CLASSIC_MCELIECE" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_classic_mceliece_8192128f_avx "" ON "OQS_ENABLE_KEM_classic_mceliece_8192128f" OFF)
endif()
endif()


option(OQS_ENABLE_KEM_HQC "Enable hqc algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_hqc_128 "" ON "OQS_ENABLE_KEM_HQC" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_PCLMULQDQ_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_hqc_128_avx2 "" ON "OQS_ENABLE_KEM_hqc_128" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_hqc_192 "" ON "OQS_ENABLE_KEM_HQC" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_PCLMULQDQ_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_hqc_192_avx2 "" ON "OQS_ENABLE_KEM_hqc_192" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_hqc_256 "" ON "OQS_ENABLE_KEM_HQC" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI1_INSTRUCTIONS AND OQS_USE_PCLMULQDQ_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_hqc_256_avx2 "" ON "OQS_ENABLE_KEM_hqc_256" OFF)
endif()
endif()


option(OQS_ENABLE_KEM_KYBER "Enable kyber algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_kyber_512 "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_512_avx2 "" ON "OQS_ENABLE_KEM_kyber_512" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_kyber_768 "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_768_avx2 "" ON "OQS_ENABLE_KEM_kyber_768" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_kyber_1024 "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_1024_avx2 "" ON "OQS_ENABLE_KEM_kyber_1024" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_kyber_512_90s "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS AND OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_512_90s_avx2 "" ON "OQS_ENABLE_KEM_kyber_512_90s" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_kyber_768_90s "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS AND OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_768_90s_avx2 "" ON "OQS_ENABLE_KEM_kyber_768_90s" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_kyber_1024_90s "" ON "OQS_ENABLE_KEM_KYBER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS AND OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_kyber_1024_90s_avx2 "" ON "OQS_ENABLE_KEM_kyber_1024_90s" OFF)
endif()
endif()


option(OQS_ENABLE_KEM_NTRU "Enable ntru algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps2048509 "" ON "OQS_ENABLE_KEM_NTRU" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps2048509_avx2 "" ON "OQS_ENABLE_KEM_ntru_hps2048509" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps2048677 "" ON "OQS_ENABLE_KEM_NTRU" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps2048677_avx2 "" ON "OQS_ENABLE_KEM_ntru_hps2048677" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps4096821 "" ON "OQS_ENABLE_KEM_NTRU" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntru_hps4096821_avx2 "" ON "OQS_ENABLE_KEM_ntru_hps4096821" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntru_hrss701 "" ON "OQS_ENABLE_KEM_NTRU" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_BMI2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntru_hrss701_avx2 "" ON "OQS_ENABLE_KEM_ntru_hrss701" OFF)
endif()
endif()


option(OQS_ENABLE_KEM_NTRUPRIME "Enable ntruprime algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr653 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr653_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_ntrulpr653" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr761 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr761_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_ntrulpr761" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr857 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_ntrulpr857_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_ntrulpr857" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup653 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup653_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_sntrup653" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup761 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup761_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_sntrup761" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup857 "" ON "OQS_ENABLE_KEM_NTRUPRIME" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_ntruprime_sntrup857_avx2 "" ON "OQS_ENABLE_KEM_ntruprime_sntrup857" OFF)
endif()
endif()


option(OQS_ENABLE_KEM_SABER "Enable saber algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_KEM_saber_lightsaber "" ON "OQS_ENABLE_KEM_SABER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_saber_lightsaber_avx2 "" ON "OQS_ENABLE_KEM_saber_lightsaber" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_saber_saber "" ON "OQS_ENABLE_KEM_SABER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_saber_saber_avx2 "" ON "OQS_ENABLE_KEM_saber_saber" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_KEM_saber_firesaber "" ON "OQS_ENABLE_KEM_SABER" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_KEM_saber_firesaber_avx2 "" ON "OQS_ENABLE_KEM_saber_firesaber" OFF)
endif()
endif()


option(OQS_ENABLE_SIG_DILITHIUM "Enable dilithium algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_SIG_dilithium_2 "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_2_avx2 "" ON "OQS_ENABLE_SIG_dilithium_2" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_dilithium_3 "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_3_avx2 "" ON "OQS_ENABLE_SIG_dilithium_3" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_dilithium_5 "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_5_avx2 "" ON "OQS_ENABLE_SIG_dilithium_5" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_dilithium_2_aes "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_AES_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_2_aes_avx2 "" ON "OQS_ENABLE_SIG_dilithium_2_aes" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_dilithium_3_aes "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_AES_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_3_aes_avx2 "" ON "OQS_ENABLE_SIG_dilithium_3_aes" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_dilithium_5_aes "" ON "OQS_ENABLE_SIG_DILITHIUM" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Darwin|Linux")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS AND OQS_USE_AES_INSTRUCTIONS AND OQS_USE_POPCNT_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_dilithium_5_aes_avx2 "" ON "OQS_ENABLE_SIG_dilithium_5_aes" OFF)
endif()
endif()


option(OQS_ENABLE_SIG_FALCON "Enable falcon algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_SIG_falcon_512 "" ON "OQS_ENABLE_SIG_FALCON" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_falcon_512_avx2 "" ON "OQS_ENABLE_SIG_falcon_512" OFF)
endif()
endif()

cmake_dependent_option(OQS_ENABLE_SIG_falcon_1024 "" ON "OQS_ENABLE_SIG_FALCON" OFF)
if(CMAKE_SYSTEM_NAME MATCHES "Linux|Darwin")
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_falcon_1024_avx2 "" ON "OQS_ENABLE_SIG_falcon_1024" OFF)
endif()
endif()


option(OQS_ENABLE_SIG_RAINBOW "Enable rainbow algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_I_classic "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_I_circumzenithal "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_I_compressed "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_III_classic "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_III_circumzenithal "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_III_compressed "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_V_classic "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_V_circumzenithal "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)
cmake_dependent_option(OQS_ENABLE_SIG_rainbow_V_compressed "" ON "OQS_ENABLE_SIG_RAINBOW" OFF)

option(OQS_ENABLE_SIG_SPHINCS "Enable sphincs algorithm family" ON)
cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128f_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_128f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128f_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_128f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128s_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_128s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_128s_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_128s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192f_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_192f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192f_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_192f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192s_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_192s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_192s_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_192s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256f_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_256f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256f_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_256f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256s_robust_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_256s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AES_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_haraka_256s_simple_aesni "" ON "OQS_ENABLE_SIG_sphincs_haraka_256s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_128f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_128f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_128s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_128s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_128s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_192f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_192f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_192s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_192s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_192s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_256f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_256f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_256s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_sha256_256s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_sha256_256s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_128f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_128f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_128s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_128s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_128s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_192f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_192f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_192s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_192s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_192s_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256f_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256f_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_256f_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256f_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256f_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_256f_simple" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256s_robust "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256s_robust_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_256s_robust" OFF)
endif()

cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256s_simple "" ON "OQS_ENABLE_SIG_SPHINCS" OFF)
if(OQS_DIST_X86_64_BUILD OR (OQS_USE_AVX2_INSTRUCTIONS))
    cmake_dependent_option(OQS_ENABLE_SIG_sphincs_shake256_256s_simple_avx2 "" ON "OQS_ENABLE_SIG_sphincs_shake256_256s_simple" OFF)
endif()

##### OQS_COPY_FROM_UPSTREAM_FRAGMENT_ADD_ENABLE_BY_ALG_END

if(${OQS_MINIMAL_BUILD})
  # Set every OQS_ENABLE_* variable =OFF unless it one of the following.
  #  1. the switch for the default algorithm's family, e.g OQS_ENABLE_KEM_KYBER
  #  2. the switch for the default algorithm, e.g. OQS_ENABLE_KEM_kyber_768.
  #  3. the switch for platform-specific ("_aesni" or "_avx2") implementation of
  #     the default algorithm, e.g. OQS_ENABLE_KEM_kyber_768_avx2.

  string(REPLACE "OQS_KEM_alg_" "OQS_ENABLE_KEM_" default_kem_switch ${OQS_KEM_DEFAULT})
  string(REPLACE "OQS_SIG_alg_" "OQS_ENABLE_SIG_" default_sig_switch ${OQS_SIG_DEFAULT})
  string(TOUPPER ${default_kem_switch} default_kem_switch_upper) # The default kem's family is a prefix of this string.
  string(TOUPPER ${default_sig_switch} default_sig_switch_upper)

  get_cmake_property(_vars VARIABLES)
  foreach (_var ${_vars})
      if(_var MATCHES "^OQS_ENABLE_..._" AND NOT _var MATCHES "_AVAILABLE$")
          set(${_var} OFF)
          # Case 1, family name
          if(${default_kem_switch_upper} MATCHES "^${_var}"
          OR ${default_sig_switch_upper} MATCHES "^${_var}")
              set(${_var} ON)
          endif()
          # Case 2, exact match
          if(${_var}X STREQUAL ${default_kem_switch}X
          OR ${_var}X STREQUAL ${default_sig_switch}X)
              set(${_var} ON)
          endif()
          # Case 3, platform specific
          string(REPLACE "_aesni" "" _var_base ${_var})
          string(REPLACE "_avx2" "" _var_base ${_var_base})
          string(REPLACE "_avx" "" _var_base ${_var_base})
          if(${_var}_AVAILABLE)
              if(${_var_base}X STREQUAL ${default_kem_switch}X
              OR ${_var_base}X STREQUAL ${default_sig_switch}X)
                  set(${_var} ON)
              endif()
          endif()
      endif()
  endforeach()
endif()
