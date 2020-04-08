/*
 * Copyright (c) 2007, 2020 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0, which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception, which is available at
 * https://www.gnu.org/software/classpath/license.html.
 *
 * SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
 */

package com.sun.ts.tests.jpa.core.entityManager;

import jakarta.persistence.*;

@Entity
@Table(name = "PURCHASE_ORDER")
public class Order implements java.io.Serializable {

  private int id;

  private int total;

  private String description;

  public Order() {
  }

  public Order(int total) {
    this.total = total;
  }

  public Order(String description) {
    this.description = description;
  }

  public Order(int id, int total) {
    this.id = id;
    this.total = total;
  }

  public Order(int id, int total, String description) {
    this.id = id;
    this.total = total;
    this.description = description;
  }

  @Id
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getTotal() {
    return total;
  }

  public void setTotal(int total) {
    this.total = total;
  }

  public String getdescription() {
    return description;
  }

  public void setdescription(String description) {
    this.description = description;
  }

  public String toString() {
    return "Order id=" + getId() + ", total=" + getTotal() + ", desc="
        + getdescription();
  }

  @Override
  public boolean equals(Object o) {
    // check for self-comparison
    if (this == o)
      return true;
    if (!(o instanceof Order))
      return false;

    Order o1 = (Order) o;

    boolean result = false;

    if (this.getId() == o1.getId()
        && this.getdescription().equals(o1.getdescription())
        && this.getTotal() == o1.getTotal()) {
      result = true;
    }

    return result;
  }
}
