// Copyright (c) 2021 The worldwideweb Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef worldwideweb_RPC_NET_H
#define worldwideweb_RPC_NET_H

class CConnman;
class PeerManager;
struct NodeContext;

CConnman& EnsureConnman(const NodeContext& node);
PeerManager& EnsurePeerman(const NodeContext& node);

#endif // worldwideweb_RPC_NET_H
