#! /usr/bin/env python
#===============================================================================
# Copyright 2001-2007 gemalto
# Author: Jean-Daniel Aussel, mailto:jean-daniel.aussel@gemalto.com
#
# This file is part of scard-python.
#
# scard-python is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# scard-python is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with scard-python; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#===============================================================================
# Sample for python PCSC wrapper module
#===============================================================================
# Get card ATR in first pcsc reader
#===============================================================================

from smartcard.scard import *

try:
    hresult, hcontext = SCardEstablishContext( SCARD_SCOPE_USER )
    if hresult!=0:
        raise  'Failed to establish context: ' + SCardGetErrorMessage(hresult)
    print 'Context established!'

    try:
        hresult, readers = SCardListReaders( hcontext, [] )
        if hresult!=0:
            raise  'Failed to list readers: ' + SCardGetErrorMessage(hresult)
        if len(readers)<1:
            raise  'No smart card readers'
        print 'PCSC Readers: ', readers

        for reader in readers:
            print 'Trying to retreive ATR of card in ', reader

            hresult, hcard, dwActiveProtocol = SCardConnect(
                hcontext, reader, SCARD_SHARE_SHARED, SCARD_PROTOCOL_T0 )
            if hresult!=0:
                print 'Unable to connect: ' + SCardGetErrorMessage(hresult)
            else:

                print 'Connected with active protocol ', dwActiveProtocol

                try:
                    hresult, reader, state, protocol, atr = SCardStatus( hcard )
                    if hresult!=0:
                        print 'failed to get status: ' + SCardGetErrorMessage(hresult)
                    print 'Reader: ', reader
                    print 'State: ', state
                    print 'Protocol: ', protocol
                    print 'ATR: ',
                    for i in xrange(len(atr)):
                        print "0x%.2X" % atr[i],
                    print ""

                finally:
                    hresult = SCardDisconnect( hcard, SCARD_UNPOWER_CARD )
                    if hresult!=0:
                        print 'Failed to disconnect: ' + SCardGetErrorMessage(hresult)
                    print 'Disconnected'


    finally:
        hresult = SCardReleaseContext( hcontext )
        if hresult!=0:
            raise  'Failed to release context: ' + SCardGetErrorMessage(hresult)
        print 'Released context.'

except:
    import sys
    print sys.exc_info()[0], ': ', sys.exc_info()[1]

import sys
if 'win32'==sys.platform:
    print 'press Enter to continue'
    sys.stdin.read(1)


