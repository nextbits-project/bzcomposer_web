package com.nxsol.bzcomposer.company.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "bca_mailtemplate")
public class BcaMailtemplate {

    @Id
    @Column(name= "TemplateID", nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer templateId;

    @Column(name= "TemplateName")
    private String templateName;

    @Column(name= "TemplateContent", columnDefinition = "longtext")
    private String templateContent;

    @Column(name= "Subject", columnDefinition = "longtext")
    private String subject;

    @Column(name= "Active")
    private Integer active;

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(final Integer templateId) {
        this.templateId = templateId;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(final String templateName) {
        this.templateName = templateName;
    }

    public String getTemplateContent() {
        return templateContent;
    }

    public void setTemplateContent(final String templateContent) {
        this.templateContent = templateContent;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(final String subject) {
        this.subject = subject;
    }

    public Integer getActive() {
        return active;
    }

    public void setActive(final Integer active) {
        this.active = active;
    }

}
