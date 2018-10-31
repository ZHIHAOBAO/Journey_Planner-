/* This program is free software: you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public License
 as published by the Free Software Foundation, either version 3 of
 the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>. */

package org.opentripplanner.gtfs.mapping;

import org.junit.Test;
import org.onebusaway.gtfs.model.AgencyAndId;
import org.onebusaway.gtfs.model.FareAttribute;

import java.util.Collection;
import java.util.Collections;

import static java.util.Collections.singleton;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class FareAttributeMapperTest {
    private static final org.onebusaway.gtfs.model.FareAttribute FARE_ATTRIBUTE = new org.onebusaway.gtfs.model.FareAttribute();

    private static final AgencyAndId ID = new AgencyAndId("A", "1");

    private static final String CURRENCY_TYPE = "NOK";

    private static final int JOURNEY_DURATION = 10;

    private static final int PAY_MENTMETHOD = 1;

    private static final float PRICE = 0.3f;

    private static final float SENIOR_PRICE = 0.7f;

    private static final float YOUTH_PRICE = 0.9f;

    private static final int TRANSFER_DURATION = 3;

    private static final int TRANSFERS = 2;

    static {
        FARE_ATTRIBUTE.setId(ID);
        FARE_ATTRIBUTE.setCurrencyType(CURRENCY_TYPE);
        FARE_ATTRIBUTE.setJourneyDuration(JOURNEY_DURATION);
        FARE_ATTRIBUTE.setPaymentMethod(PAY_MENTMETHOD);
        FARE_ATTRIBUTE.setPrice(PRICE);
        FARE_ATTRIBUTE.setSeniorPrice(SENIOR_PRICE);
        FARE_ATTRIBUTE.setYouthPrice(YOUTH_PRICE);
        FARE_ATTRIBUTE.setTransferDuration(TRANSFER_DURATION);
        FARE_ATTRIBUTE.setTransfers(TRANSFERS);
    }

    private FareAttributeMapper subject = new FareAttributeMapper();

    @Test
    public void testMapCollection() throws Exception {
        assertNull(subject.map((Collection<FareAttribute>) null));
        assertTrue(subject.map(Collections.emptyList()).isEmpty());
        assertEquals(1, subject.map(singleton(FARE_ATTRIBUTE)).size());
    }

    @Test
    public void testMap() throws Exception {
        org.onebusaway2.gtfs.model.FareAttribute result = subject.map(FARE_ATTRIBUTE);

        assertEquals("A_1", result.getId().toString());
        assertEquals(CURRENCY_TYPE, result.getCurrencyType());
        assertEquals(JOURNEY_DURATION, result.getJourneyDuration());
        assertEquals(PAY_MENTMETHOD, result.getPaymentMethod());
        assertEquals(PRICE, result.getPrice(), 0.00001f);
        assertEquals(SENIOR_PRICE, result.getSeniorPrice(), 0.00001f);
        assertEquals(YOUTH_PRICE, result.getYouthPrice(), 0.00001f);
        assertEquals(TRANSFER_DURATION, result.getTransferDuration());
        assertEquals(TRANSFERS, result.getTransfers());
    }

    @Test
    public void testMapWithNulls() throws Exception {
        FareAttribute orginal = new FareAttribute();
        orginal.setId(ID);
        org.onebusaway2.gtfs.model.FareAttribute result = subject.map(orginal);

        assertNotNull(result.getId());
        assertNull(result.getCurrencyType());
        assertFalse(result.isJourneyDurationSet());
        assertEquals(0, result.getPaymentMethod());
        assertEquals(0, result.getPrice(), 0.001d);
        assertEquals(0, result.getSeniorPrice(), 0.001d);
        assertEquals(0, result.getYouthPrice(), 0.001d);
        assertFalse(result.isTransferDurationSet());
        assertFalse(result.isTransfersSet());
    }

    /** Mapping the same object twice, should return the the same instance. */
    @Test
    public void testMapCache() throws Exception {
        org.onebusaway2.gtfs.model.FareAttribute result1 = subject.map(FARE_ATTRIBUTE);
        org.onebusaway2.gtfs.model.FareAttribute result2 = subject.map(FARE_ATTRIBUTE);

        assertTrue(result1 == result2);
    }
}