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
import org.onebusaway.gtfs.model.Agency;

import java.util.Collection;
import java.util.Collections;

import static java.util.Collections.singleton;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class AgencyMapperTest {
    private static final Agency AGENCY = new Agency();

    private static final String ID = "ID";

    private static final String NAME = "Ann";

    private static final String LANG = "NO";

    private static final String PHONE = "+47 987 65 432";

    private static final String TIMEZONE = "GMT";

    private static final String URL = "www.url.com";

    private static final String FARE_URL = "www.url.com/fare";

    private static final String BRANDING_URL = "www.url.com/brand";

    static {
        AGENCY.setId(ID);
        AGENCY.setName(NAME);
        AGENCY.setLang(LANG);
        AGENCY.setPhone(PHONE);
        AGENCY.setTimezone(TIMEZONE);
        AGENCY.setUrl(URL);
        AGENCY.setFareUrl(FARE_URL);
        AGENCY.setBrandingUrl(BRANDING_URL);
    }

    private AgencyMapper subject = new AgencyMapper();

    @Test
    public void testMapCollection() throws Exception {
        assertNull(subject.map((Collection<Agency>) null));
        assertTrue(subject.map(Collections.emptyList()).isEmpty());
        assertEquals(1, subject.map(singleton(AGENCY)).size());
    }

    @Test
    public void testMap() throws Exception {
        org.onebusaway2.gtfs.model.Agency result = subject.map(AGENCY);

        assertEquals(ID, result.getId());
        assertEquals(NAME, result.getName());
        assertEquals(LANG, result.getLang());
        assertEquals(PHONE, result.getPhone());
        assertEquals(TIMEZONE, result.getTimezone());
        assertEquals(URL, result.getUrl());
        assertEquals(FARE_URL, result.getFareUrl());
        assertEquals(BRANDING_URL, result.getBrandingUrl());
    }

    @Test
    public void testMapWithNulls() throws Exception {
        Agency orginal = new Agency();
        orginal.setId(ID);
        org.onebusaway2.gtfs.model.Agency result = subject.map(orginal);

        assertNotNull(result.getId());
        assertNull(result.getName());
        assertNull(result.getLang());
        assertNull(result.getPhone());
        assertNull(result.getTimezone());
        assertNull(result.getUrl());
        assertNull(result.getFareUrl());
        assertNull(result.getBrandingUrl());
    }

    /** Mapping the same object twice, should return the the same instance. */
    @Test
    public void testMapCache() throws Exception {
        org.onebusaway2.gtfs.model.Agency result1 = subject.map(AGENCY);
        org.onebusaway2.gtfs.model.Agency result2 = subject.map(AGENCY);

        assertTrue(result1 == result2);
    }
}