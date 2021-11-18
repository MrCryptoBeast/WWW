// Copyright (c) 2011-2020 The worldwideweb Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef worldwideweb_QT_worldwidewebADDRESSVALIDATOR_H
#define worldwideweb_QT_worldwidewebADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class worldwidewebAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit worldwidewebAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

/** worldwideweb address widget validator, checks for a valid worldwideweb address.
 */
class worldwidewebAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit worldwidewebAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

#endif // worldwideweb_QT_worldwidewebADDRESSVALIDATOR_H
