/**
 * Copyright (c) 2020, Self XDSD Contributors
 * All rights reserved.
 * <p>
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"),
 * to read the Software only. Permission is hereby NOT GRANTED to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software.
 * <p>
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 * OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
package com.selfxdsd.storage;

import com.selfxdsd.api.*;
import com.selfxdsd.api.storage.Storage;
import org.hamcrest.MatcherAssert;
import org.hamcrest.Matchers;
import org.junit.Test;
import org.mockito.Mockito;

import java.util.Iterator;

/**
 * Integration tests for {@link SelfPayoutMethods}.
 * @author Mihai Andronache (amihaiemil@gmail.com)
 * @version $Id$
 * @since 0.0.9
 */
public final class SelfPayoutMethodsITCase {

    /**
     * SelfPayoutMethods should only register Stripe-type methods for now.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void registersOnlyStripeMethods() {
        final Storage storage = new SelfJooq(new H2Database());
        storage.payoutMethods().register(
            Mockito.mock(Contributor.class),
            PayoutMethod.Type.PAYPAL,
            "paypal123Id"
        );
    }

    /**
     * SelfPayoutMethods can register a payout method for a contributor.
     */
    @Test
    public void registersMethod() {
        final Storage storage = new SelfJooq(new H2Database());
        final PayoutMethods methods = storage.payoutMethods();
        final Contributor john = storage.contributors().getById(
            "john", Provider.Names.GITHUB
        );
        MatcherAssert.assertThat(john, Matchers.notNullValue());
        MatcherAssert.assertThat(
            methods.ofContributor(john),
            Matchers.emptyIterable()
        );
        final PayoutMethod registered = methods.register(
            john,
            PayoutMethod.Type.STRIPE,
            "acct2_0002"
        );
        MatcherAssert.assertThat(
            registered.contributor(),
            Matchers.equalTo(john)
        );
        MatcherAssert.assertThat(
            registered.identifier(),
            Matchers.equalTo("acct2_0002")
        );
        MatcherAssert.assertThat(
            registered.active(),
            Matchers.is(Boolean.FALSE)
        );
        MatcherAssert.assertThat(
            registered.type(),
            Matchers.equalToIgnoringCase(PayoutMethod.Type.STRIPE)
        );
        MatcherAssert.assertThat(
            methods.ofContributor(john),
            Matchers.iterableWithSize(1)
        );
    }

    /**
     * SelfPayoutMethods can activate a PayoutMethod.
     */
    @Test
    public void activatesPayoutMethod() {
        final Storage storage = new SelfJooq(new H2Database());
        final PayoutMethods methods = storage.payoutMethods();
        final Contributor bob = storage.contributors().getById(
            "bob", Provider.Names.GITHUB
        );
        MatcherAssert.assertThat(bob, Matchers.notNullValue());
        final PayoutMethod registered = methods.register(
            bob,
            PayoutMethod.Type.STRIPE,
            "acct2_0002"
        );
        MatcherAssert.assertThat(
            registered.active(),
            Matchers.is(Boolean.FALSE)
        );
        MatcherAssert.assertThat(
            methods.ofContributor(bob),
            Matchers.iterableWithSize(1)
        );
        final PayoutMethod activated = methods.activate(registered);
        MatcherAssert.assertThat(
            activated.active(),
            Matchers.is(Boolean.TRUE)
        );
        final PayoutMethod selected = methods
            .ofContributor(bob)
            .iterator()
            .next();
        MatcherAssert.assertThat(
            selected.active(),
            Matchers.is(Boolean.TRUE)
        );
    }

    /**
     * Method ofContributor can return a Contributor's
     * PayoutMethods.
     */
    @Test
    public void ofContributorReturnsPayoutMethods() {
        final Storage storage = new SelfJooq(new H2Database());
        final Contributor maria = storage.contributors().getById(
            "maria", Provider.Names.GITHUB
        );
        MatcherAssert.assertThat(maria, Matchers.notNullValue());
        final PayoutMethods methods = storage
            .payoutMethods()
            .ofContributor(maria);
        MatcherAssert.assertThat(
            methods,
            Matchers.iterableWithSize(1)
        );
        final PayoutMethod method = methods.iterator().next();
        MatcherAssert.assertThat(
            method.identifier(),
            Matchers.equalTo("acct_001")
        );
        MatcherAssert.assertThat(
            method.active(),
            Matchers.is(Boolean.TRUE)
        );
        MatcherAssert.assertThat(
            method.type(),
            Matchers.equalToIgnoringCase(PayoutMethod.Type.STRIPE)
        );
        MatcherAssert.assertThat(
            method.contributor(),
            Matchers.equalTo(maria)
        );
    }

    /**
     * Method ofContributor can return an empty iterable
     * if the Contributor has no registered PayoutMethods.
     */
    @Test
    public void ofContributorReturnsEmpty() {
        final Storage storage = new SelfJooq(new H2Database());
        final Contributor dan = storage.contributors().getById(
            "dmarkov", Provider.Names.GITHUB
        );
        MatcherAssert.assertThat(dan, Matchers.notNullValue());
        MatcherAssert.assertThat(
            storage.payoutMethods().ofContributor(dan),
            Matchers.emptyIterable()
        );
    }

    /**
     * We shouldn't be able to iterate all of them.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void cannotIterate() {
        final Iterator<PayoutMethod> iterator = new SelfJooq(new H2Database())
            .payoutMethods()
            .iterator();
    }

    /**
     * We shouldn't be able to get the active PayoutMethod
     * out of all of them.
     */
    @Test(expected = UnsupportedOperationException.class)
    public void cannotGetActive() {
        final PayoutMethod active = new SelfJooq(new H2Database())
            .payoutMethods()
            .active();
    }
}
