/*
 * Copyright (C) 2011 Google, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.onebusaway2.gtfs.model;

import org.onebusaway2.gtfs.model.calendar.ServiceDate;

public final class FeedInfo extends IdentityBean<Integer> {

    private static final long serialVersionUID = 1L;

    private int id;

    private String publisherName;

    private String publisherUrl;

    private String lang;

    private ServiceDate startDate;

    private ServiceDate endDate;

    private String version;

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getPublisherUrl() {
        return publisherUrl;
    }

    public void setPublisherUrl(String publisherUrl) {
        this.publisherUrl = publisherUrl;
    }

    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    public ServiceDate getStartDate() {
        return startDate;
    }

    public void setStartDate(ServiceDate startDate) {
        this.startDate = startDate;
    }

    public ServiceDate getEndDate() {
        return endDate;
    }

    public void setEndDate(ServiceDate endDate) {
        this.endDate = endDate;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Override
    public Integer getId() {
        return id;
    }

    @Override
    public void setId(Integer id) {
        this.id = id;
    }

    public String toString() {
        return "<FeedInfo " + getId() + ">";
    }

}
