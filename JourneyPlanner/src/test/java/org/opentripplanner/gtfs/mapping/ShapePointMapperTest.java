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
import org.onebusaway.gtfs.model.ShapePoint;

import java.util.Collection;
import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

public class ShapePointMapperTest {
    private static final AgencyAndId AGENCY_AND_ID = new AgencyAndId("A", "1");

    private static final Integer ID = 45;

    private static final double DIST_TRAVELED = 2.0d;

    private static final double LAT = 60.0d;

    private static final double LON = 45.0d;

    private static final int SEQUENCE = 3;

    private static final ShapePoint SHAPE_POINT = new ShapePoint();

    static {
        SHAPE_POINT.setId(ID);
        SHAPE_POINT.setDistTraveled(DIST_TRAVELED);
        SHAPE_POINT.setLat(LAT);
        SHAPE_POINT.setLon(LON);
        SHAPE_POINT.setSequence(SEQUENCE);
        SHAPE_POINT.setShapeId(AGENCY_AND_ID);
    }

    private ShapePointMapper subject = new ShapePointMapper();

    @Test
    public void testMapCollection() throws Exception {
        assertNull(subject.map((Collection<ShapePoint>) null));
        assertTrue(subject.map(Collections.emptyList()).isEmpty());
        assertEquals(1, subject.map(Collections.singleton(SHAPE_POINT)).size());
    }

    @Test
    public void testMap() throws Exception {
        org.onebusaway2.gtfs.model.ShapePoint result = subject.map(SHAPE_POINT);

        assertEquals(ID, result.getId());
        assertEquals(DIST_TRAVELED, result.getDistTraveled(), 0.0001d);
        assertEquals(LAT, result.getLat(), 0.0001d);
        assertEquals(LON, result.getLon(), 0.0001d);
        assertEquals(SEQUENCE, result.getSequence());
        assertEquals("A_1", result.getShapeId().toString());
    }

    @Test
    public void testMapWithNulls() throws Exception {
        org.onebusaway2.gtfs.model.ShapePoint result = subject.map(new ShapePoint());

        assertNotNull(result.getId());
        assertFalse(result.isDistTraveledSet());
        assertEquals(0d, result.getLat(), 0.00001);
        assertEquals(0d, result.getLon(), 0.00001);
        assertEquals(0d, result.getSequence(), 0.00001);
        assertNull(result.getShapeId());
    }

    /** Mapping the same object twice, should return the the same instance. */
    @Test
    public void testMapCache() throws Exception {
        org.onebusaway2.gtfs.model.ShapePoint result1 = subject.map(SHAPE_POINT);
        org.onebusaway2.gtfs.model.ShapePoint result2 = subject.map(SHAPE_POINT);

        assertTrue(result1 == result2);
    }
}