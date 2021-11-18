// Copyright (c) 2015-2020 The worldwideweb Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef worldwideweb_UTIL_URL_H
#define worldwideweb_UTIL_URL_H

#include <string>

using UrlDecodeFn = std::string(const std::string& url_encoded);
UrlDecodeFn urlDecode;
extern UrlDecodeFn* const URL_DECODE;

#endif // worldwideweb_UTIL_URL_H
