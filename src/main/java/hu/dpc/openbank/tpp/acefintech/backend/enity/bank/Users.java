/*
 * This Source Code Form is subject to the terms of the Mozilla
 * Public License, v. 2.0. If a copy of the MPL was not distributed
 * with this file, You can obtain one at
 *
 * https://mozilla.org/MPL/2.0/.
 */

package hu.dpc.openbank.tpp.acefintech.backend.enity.bank;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

import hu.dpc.openbank.tpp.acefintech.backend.enity.aisp.AccountAccount;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "USERS")
@Getter
@Setter
public class Users {
    @Id
    @Column(name = "USERNAME", nullable = false, unique = true)
    private String userName;
    @Column(name = "PASSWORD")
    private String password;
    @Column(name = "ENABLED")
    private boolean enabled;

   
}
