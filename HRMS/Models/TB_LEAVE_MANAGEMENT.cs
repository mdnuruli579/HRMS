//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HRMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TB_LEAVE_MANAGEMENT
    {
        public int leave_id { get; set; }
        public Nullable<int> employee_id { get; set; }
        public string leave_type { get; set; }
        public Nullable<System.DateTime> start_date { get; set; }
        public Nullable<System.DateTime> end_date { get; set; }
        public Nullable<int> status { get; set; }
        public Nullable<int> approved_by { get; set; }
        public Nullable<System.DateTime> created_at { get; set; }
        public Nullable<System.DateTime> updated_at { get; set; }
    
        public virtual TB_EMPLOYEE TB_EMPLOYEE { get; set; }
        public virtual TB_EMPLOYEE TB_EMPLOYEE1 { get; set; }
    }
}
