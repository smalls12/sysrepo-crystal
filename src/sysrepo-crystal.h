#ifndef _SYSREPO_CRYSTAL_H
#define _SYSREPO_CRYSTAL_H

#include <sysrepo.h>

sr_conn_ctx_t* sr_get_connection_ctx();
sr_session_ctx_t* sr_get_session_ctx();
sr_val_t* sr_get_value();
sr_subscription_ctx_t* sr_get_subscription_ctx();

#endif /* _SYSREPO_CRYSTAL_H */
