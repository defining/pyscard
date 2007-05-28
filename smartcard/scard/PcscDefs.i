/*==============================================================================
Copyright 2001-2007 gemalto
Author: Jean-Daniel Aussel, mailto:jean-daniel.aussel@gemalto.com

This file is part of pyscard.

pyscard is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

pyscard is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pyscard; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
==============================================================================*/

typedef enum
{
    SCARD_SCOPE_USER,
    SCARD_SCOPE_TERMINAL,
    SCARD_SCOPE_SYSTEM
}  ScopeType ;

typedef enum
{
    SCARD_SHARE_SHARED,
    SCARD_SHARE_EXCLUSIVE,
    SCARD_SHARE_DIRECT
}  ShareType ;

typedef enum
{
    SCARD_LEAVE_CARD,
    SCARD_RESET_CARD,
    SCARD_UNPOWER_CARD,
    SCARD_EJECT_CARD
} DispositionType ;

typedef enum
{
    SCARD_STATE_UNAWARE,
    SCARD_STATE_IGNORE,
    SCARD_STATE_CHANGED,
    SCARD_STATE_UNKNOWN,
    SCARD_STATE_UNAVAILABLE,
    SCARD_STATE_EMPTY,
    SCARD_STATE_PRESENT,
    SCARD_STATE_ATRMATCH,
    SCARD_STATE_EXCLUSIVE,
    SCARD_STATE_INUSE,
    SCARD_STATE_MUTE
} StateType ;

#ifdef PCSCLITE
    #ifdef __APPLE__
        %constant unsigned long SCARD_STATE_UNPOWERED = 0x0400 ;
    #else // __APPLE__
        typedef enum
        {
            SCARD_STATE_UNPOWERED
        } nonAppleStateType ;
    #endif //!__APPLE_
#endif //PCSCLITE

// protocols
#ifdef WIN32
typedef enum
{
    SCARD_PROTOCOL_UNDEFINED,
    SCARD_PROTOCOL_T0,
    SCARD_PROTOCOL_T1,
    SCARD_PROTOCOL_RAW,
    SCARD_PROTOCOL_Tx,
    SCARD_PROTOCOL_DEFAULT,
    SCARD_PROTOCOL_OPTIMAL
} ProtocolType ;

// define pcsc lite constants for winscard
%constant unsigned long SCARD_PROTOCOL_UNSET = SCARD_PROTOCOL_UNDEFINED ;
%constant unsigned long SCARD_PROTOCOL_ANY = SCARD_PROTOCOL_Tx ;
%constant unsigned long SCARD_PROTOCOL_T15 = 0x00000008 ;
#endif

#ifdef PCSCLITE
    #ifdef __APPLE__
        typedef enum
        {
            SCARD_PROTOCOL_T0,
            SCARD_PROTOCOL_T1,
            SCARD_PROTOCOL_RAW,
            SCARD_PROTOCOL_ANY
        } ProtocolType ;
        %constant unsigned long SCARD_PROTOCOL_UNSET = SCARD_PROTOCOL_ANY ;
        %constant unsigned long SCARD_PROTOCOL_T15 = 0x00000008 ;
        %constant unsigned long SCARD_PROTOCOL_UNDEFINED = SCARD_PROTOCOL_ANY ;
        %constant unsigned long SCARD_PROTOCOL_OPTIMAL = SCARD_PROTOCOL_ANY ;
    #else //__APPLE__
        typedef enum
        {
            SCARD_PROTOCOL_UNSET,
            SCARD_PROTOCOL_T0,
            SCARD_PROTOCOL_T1,
            SCARD_PROTOCOL_RAW,
            SCARD_PROTOCOL_T15,
            SCARD_PROTOCOL_ANY
        } ProtocolType ;
        %constant unsigned long SCARD_PROTOCOL_UNDEFINED = SCARD_PROTOCOL_UNSET ;
        %constant unsigned long SCARD_PROTOCOL_OPTIMAL = SCARD_PROTOCOL_UNSET ;
    #endif //!__APPLE__
    // define winscard constants for pcsc lite
    %constant unsigned long SCARD_PROTOCOL_UNDEFINED = SCARD_PROTOCOL_UNSET ;
    %constant unsigned long SCARD_PROTOCOL_Tx = SCARD_PROTOCOL_ANY ;
    %constant unsigned long SCARD_PROTOCOL_DEFAULT = SCARD_PROTOCOL_ANY ;
    %constant unsigned long SCARD_PROTOCOL_OPTIMAL = SCARD_PROTOCOL_UNSET ;
#endif //PCSCLITE


%constant unsigned long SCARD_PCI_T0 = 0x01 ;
%constant unsigned long SCARD_PCI_T1 = 0x02 ;
%constant unsigned long SCARD_PCI_RAW = 0x04 ;


#ifdef WIN32

typedef enum
{
    SCARD_PROVIDER_PRIMARY,
    SCARD_PROVIDER_CSP
} ProviderType ;


typedef enum
{
    SCARD_ATTR_VENDOR_NAME,
    SCARD_ATTR_VENDOR_IFD_TYPE,
    SCARD_ATTR_VENDOR_IFD_VERSION,
    SCARD_ATTR_VENDOR_IFD_SERIAL_NO,
    SCARD_ATTR_CHANNEL_ID,
    SCARD_ATTR_DEFAULT_CLK,
    SCARD_ATTR_MAX_CLK,
    SCARD_ATTR_DEFAULT_DATA_RATE,
    SCARD_ATTR_MAX_DATA_RATE,
    SCARD_ATTR_MAX_IFSD,
    SCARD_ATTR_POWER_MGMT_SUPPORT,
    SCARD_ATTR_USER_TO_CARD_AUTH_DEVICE,
    SCARD_ATTR_USER_AUTH_INPUT_DEVICE,
    SCARD_ATTR_CHARACTERISTICS,
    SCARD_ATTR_CURRENT_PROTOCOL_TYPE,
    SCARD_ATTR_CURRENT_CLK,
    SCARD_ATTR_CURRENT_F,
    SCARD_ATTR_CURRENT_D,
    SCARD_ATTR_CURRENT_N,
    SCARD_ATTR_CURRENT_W,
    SCARD_ATTR_CURRENT_IFSC,
    SCARD_ATTR_CURRENT_IFSD,
    SCARD_ATTR_CURRENT_BWT,
    SCARD_ATTR_CURRENT_CWT,
    SCARD_ATTR_CURRENT_EBC_ENCODING,
    SCARD_ATTR_EXTENDED_BWT,
    SCARD_ATTR_ICC_PRESENCE,
    SCARD_ATTR_ICC_INTERFACE_STATUS,
    SCARD_ATTR_CURRENT_IO_STATE,
    SCARD_ATTR_ATR_STRING,
    SCARD_ATTR_ICC_TYPE_PER_ATR,
    SCARD_ATTR_ESC_RESET,
    SCARD_ATTR_ESC_CANCEL,
    SCARD_ATTR_ESC_AUTHREQUEST,
    SCARD_ATTR_MAXINPUT,
    SCARD_ATTR_DEVICE_UNIT,
    SCARD_ATTR_DEVICE_IN_USE,
    SCARD_ATTR_DEVICE_FRIENDLY_NAME_A,
    SCARD_ATTR_DEVICE_SYSTEM_NAME_A,
    SCARD_ATTR_DEVICE_FRIENDLY_NAME_W,
    SCARD_ATTR_DEVICE_SYSTEM_NAME_W,
    SCARD_ATTR_SUPRESS_T1_IFS_REQUEST
} AttributeType ;

typedef enum
{
    SCARD_E_UNEXPECTED               ,
    SCARD_E_ICC_INSTALLATION         ,
    SCARD_E_ICC_CREATEORDER          ,
    SCARD_E_DIR_NOT_FOUND            ,
    SCARD_E_FILE_NOT_FOUND           ,
    SCARD_E_NO_DIR                   ,
    SCARD_E_NO_FILE                  ,
    SCARD_E_NO_ACCESS                ,
    SCARD_E_WRITE_TOO_MANY           ,
    SCARD_E_BAD_SEEK                 ,
    SCARD_E_INVALID_CHV              ,
    SCARD_E_UNKNOWN_RES_MNG          ,
    SCARD_E_NO_SUCH_CERTIFICATE      ,
    SCARD_E_CERTIFICATE_UNAVAILABLE  ,
    SCARD_E_NO_READERS_AVAILABLE     ,
    SCARD_E_COMM_DATA_LOST           ,
    SCARD_E_NO_KEY_CONTAINER         ,
    SCARD_E_SERVER_TOO_BUSY          ,
    SCARD_W_SECURITY_VIOLATION       ,
    SCARD_W_WRONG_CHV                ,
    SCARD_W_CHV_BLOCKED              ,
    SCARD_W_EOF                      ,
    SCARD_W_CANCELLED_BY_USER        ,
    SCARD_W_CARD_NOT_AUTHENTICATED   ,
    // from winerror.h
    ERROR_ALREADY_EXISTS
} ErrorTypeWin32Only;

#endif // WIN32


#ifdef PCSCLITE
typedef enum
{
    SCARD_ATTR_VENDOR_NAME              ,
    SCARD_ATTR_VENDOR_IFD_TYPE          ,
    SCARD_ATTR_VENDOR_IFD_VERSION       ,
    SCARD_ATTR_VENDOR_IFD_SERIAL_NO     ,
    SCARD_ATTR_CHANNEL_ID               ,
    SCARD_ATTR_ASYNC_PROTOCOL_TYPES     ,
    SCARD_ATTR_DEFAULT_CLK              ,
    SCARD_ATTR_MAX_CLK                  ,
    SCARD_ATTR_DEFAULT_DATA_RATE        ,
    SCARD_ATTR_MAX_DATA_RATE            ,
    SCARD_ATTR_MAX_IFSD                 ,
    SCARD_ATTR_SYNC_PROTOCOL_TYPES      ,
    SCARD_ATTR_POWER_MGMT_SUPPORT       ,
    SCARD_ATTR_USER_TO_CARD_AUTH_DEVICE ,
    SCARD_ATTR_USER_AUTH_INPUT_DEVICE   ,
    SCARD_ATTR_CHARACTERISTICS          ,
    SCARD_ATTR_CURRENT_PROTOCOL_TYPE    ,
    SCARD_ATTR_CURRENT_CLK              ,
    SCARD_ATTR_CURRENT_F                ,
    SCARD_ATTR_CURRENT_D                ,
    SCARD_ATTR_CURRENT_N                ,
    SCARD_ATTR_CURRENT_W                ,
    SCARD_ATTR_CURRENT_IFSC             ,
    SCARD_ATTR_CURRENT_IFSD             ,
    SCARD_ATTR_CURRENT_BWT              ,
    SCARD_ATTR_CURRENT_CWT              ,
    SCARD_ATTR_CURRENT_EBC_ENCODING     ,
    SCARD_ATTR_EXTENDED_BWT             ,
    SCARD_ATTR_ICC_PRESENCE             ,
    SCARD_ATTR_ICC_INTERFACE_STATUS     ,
    SCARD_ATTR_CURRENT_IO_STATE         ,
    SCARD_ATTR_ATR_STRING               ,
    SCARD_ATTR_ICC_TYPE_PER_ATR         ,
    SCARD_ATTR_ESC_RESET                ,
    SCARD_ATTR_ESC_CANCEL               ,
    SCARD_ATTR_ESC_AUTHREQUEST          ,
    SCARD_ATTR_MAXINPUT                 ,
    SCARD_ATTR_DEVICE_UNIT              ,
    SCARD_ATTR_DEVICE_IN_USE            ,
    SCARD_ATTR_DEVICE_FRIENDLY_NAME_A   ,
    SCARD_ATTR_DEVICE_SYSTEM_NAME_A     ,
    SCARD_ATTR_DEVICE_FRIENDLY_NAME_W   ,
    SCARD_ATTR_DEVICE_SYSTEM_NAME_W     ,
    SCARD_ATTR_SUPRESS_T1_IFS_REQUEST
} AttributeType ;

%constant unsigned long SCARD_ATTR_DEVICE_FRIENDLY_NAME = SCARD_ATTR_DEVICE_FRIENDLY_NAME_A ;
%constant unsigned long SCARD_ATTR_DEVICE_SYSTEM_NAME = SCARD_ATTR_DEVICE_SYSTEM_NAME_A ;

#endif //PCSCLITE


typedef enum
{
    SCARD_S_SUCCESS                  ,
    SCARD_F_INTERNAL_ERROR           ,
    SCARD_E_CANCELLED                ,
    SCARD_E_INVALID_HANDLE           ,
    SCARD_E_INVALID_PARAMETER        ,
    SCARD_E_INVALID_TARGET           ,
    SCARD_E_NO_MEMORY                ,
    SCARD_F_WAITED_TOO_LONG          ,
    SCARD_E_INSUFFICIENT_BUFFER      ,
    SCARD_E_UNKNOWN_READER           ,
    SCARD_E_TIMEOUT                  ,
    SCARD_E_SHARING_VIOLATION        ,
    SCARD_E_NO_SMARTCARD             ,
    SCARD_E_UNKNOWN_CARD             ,
    SCARD_E_CANT_DISPOSE             ,
    SCARD_E_PROTO_MISMATCH           ,
    SCARD_E_NOT_READY                ,
    SCARD_E_INVALID_VALUE            ,
    SCARD_E_SYSTEM_CANCELLED         ,
    SCARD_F_COMM_ERROR               ,
    SCARD_F_UNKNOWN_ERROR            ,
    SCARD_E_INVALID_ATR              ,
    SCARD_E_NOT_TRANSACTED           ,
    SCARD_E_READER_UNAVAILABLE       ,
    SCARD_E_PCI_TOO_SMALL            ,
    SCARD_E_READER_UNSUPPORTED       ,
    SCARD_E_DUPLICATE_READER         ,
    SCARD_E_CARD_UNSUPPORTED         ,
    SCARD_E_NO_SERVICE               ,
    SCARD_E_SERVICE_STOPPED          ,
    SCARD_E_UNSUPPORTED_FEATURE      ,
    SCARD_W_UNSUPPORTED_CARD         ,
    SCARD_W_UNRESPONSIVE_CARD        ,
    SCARD_W_UNPOWERED_CARD           ,
    SCARD_W_RESET_CARD               ,
    SCARD_W_REMOVED_CARD
} ErrorType ;

#ifdef WIN32
typedef enum
{
    ERROR_INVALID_HANDLE
} Win32ErrorType ;
#endif //WIN32
#ifdef PCSCLITE
%constant unsigned long INVALID_HANDLE = SCARD_E_INVALID_HANDLE ;
#endif //PCSCLITE

// this error code is defined outside the enum, since it is available
// on winscard only (e.g. not in pcsc lite)
%constant unsigned long SCARD_P_SHUTDOWN = 0x80100018 ;

// Infinite timeout
%constant unsigned long INFINITE = 0xFFFFFFFF ;






